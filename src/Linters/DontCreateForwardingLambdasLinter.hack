/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

final class DontCreateForwardingLambdasLinter extends ASTLinter {
  const type TConfig =
    shape(?'noErrorForLambdaWithTypedParametersOrReturn' => bool, ...);
  const type TContext = Script;
  const type TNode = LambdaExpression;

  const string WARN_FOR_ASYNC_LAMBDA_EXCEPTIONS = <<<'M'
IMPORTANT NOTE EXTRA ATTENTION REQUIRED!
An async lambda implcitly creates wrapping Awaitables when called.
Awaitables hold their exceptions until they are joined or awaited.
Removing the lambda may change where / when exceptions are thrown.
This does not apply if callable after the await is declared async.
M;

  const string TYPE_ENFORCEMENT_LAMBDA = <<<'M'
If you made this lambda because you wanted to add runtime type enforcement,
you can configure this linter to not emit errors on 'useless' lambdas with types on the parameters or a return type.
The name of option is 'noErrorForLambdaWithTypedParametersOrReturn'.
M;

  const string CALLING_VAR = <<<'M'
You have made a lambda which forwards all its arguments to a callable held in a variable.
The order of the parameters is the same as the order of the arguments.
You could use the variable instead of the lambda. ->
M;

  const string CALLING_FUNC = <<<'M'
You have made a lambda which forwards all its arguments to a static method or function.
The order of the parameters is the same as the order of the arguments.
You could create a function reference instead. ->
M;

  <<__Override>>
  protected function getLintErrorForNode(
    this::TContext $_context,
    this::TNode $lambda,
  ): ?ASTLintError {
    if ($this->shouldIgnoreTypedLambdas() && $this->isTypedLambda($lambda)) {
      return null;
    }

    $body = static::getFunctionCallBodyOrNull($lambda);
    if ($body is null) {
      return null;
    }

    $receiver = static::getReceiverOrNullIfNotPossibleToSimplify($body);
    if ($receiver is null) {
      return null;
    }

    $parameters =
      static::extractParametersOrNullIfUsingDefunctVariadicSyntax($lambda);
    if ($parameters is null) {
      return null;
    }

    $arguments = $body->getArgumentList()?->getChildrenOfItems() ?? vec[];
    if (C\count($parameters) !== C\count($arguments)) {
      return null;
    }

    foreach (Vec\zip($parameters, $arguments) as list($param, $arg)) {
      if (
        static::parameterDisqualifiesCall($param) ||
        !static::argumentIsPlainVariableOrSpreadVariable($arg)
      ) {
        return null;
      }

      $param_name = $param->getName();
      if ($param_name is DecoratedExpression && $arg is DecoratedExpression) {
        $param_str = $param_name->getExpression() as VariableToken->getText();
        $arg_str = $arg->getExpression() as VariableExpression->getExpression()
          as Token->getText();
      } else if ($param_name is VariableToken && $arg is VariableExpression) {
        $param_str = $param_name->getText();
        $arg_str = $arg->getExpression() as VariableToken->getText();
      } else {
        // Can't simplify mismatching decorations, like `(... $x) ==> func($x)` or `($x) ==> func(...$x)`
        return null;
      }

      if ($param_str !== $arg_str) {
        return null;
      }
    }

    $error_message = static::getErrorMessageForReceiver($receiver);
    if ($lambda->hasAsync()) {
      $error_message .= "\n\n".static::WARN_FOR_ASYNC_LAMBDA_EXCEPTIONS;
    }
    if ($this->isTypedLambda($lambda)) {
      $error_message .= "\n\n".static::TYPE_ENFORCEMENT_LAMBDA;
    }

    return new ASTLintError($this, $error_message, $lambda);
  }

  private function shouldIgnoreTypedLambdas(): bool {
    return $this->getConfig()['noErrorForLambdaWithTypedParametersOrReturn'] ??
      false;
  }

  private static function getFunctionCallBodyOrNull(
    LambdaExpression $lambda,
  ): ?FunctionCallExpression {
    $body = $lambda->getBody();

    if (!$lambda->hasAsync()) {
      return $body ?as FunctionCallExpression;
    }

    // Patching up `async ($x) ==> await func($x)` to `($x) ==> func($x)`.
    if ($body is PrefixUnaryExpression && $body->getOperator() is AwaitToken) {
      return $body->getOperand() ?as FunctionCallExpression;
    }
    return null;
  }

  private function isTypedLambda(LambdaExpression $lambda): bool {
    $signature = $lambda->getSignature();
    return $signature is LambdaSignature &&
      (
        $signature->hasType() ||
        C\any(
          $signature->getParameters()?->getChildrenOfItems() ?? vec[],
          $param ==> $param->hasType(),
        )
      );
  }

  private static function getReceiverOrNullIfNotPossibleToSimplify(
    FunctionCallExpression $body,
  ): ?Node {
    $receiver = $body->getReceiver();
    if (
      !$receiver is QualifiedName &&
      !$receiver is VariableExpression &&
      !$receiver is NameToken &&
      !(
        $receiver is ScopeResolutionExpression &&
        // parent::func<> is never allowed, and self::func<> is only allowed in final classes.
        !(
          $receiver->getQualifier() is SelfToken ||
          $receiver->getQualifier() is ParentToken
        )
      )
    ) {
      return null;
    }
    return $receiver;
  }

  private static function extractParametersOrNullIfUsingDefunctVariadicSyntax(
    LambdaExpression $lambda,
  ): ?vec<ParameterDeclaration> {
    $signature = $lambda->getSignature();
    if ($signature is VariableToken) {
      return vec[new ParameterDeclaration(
        null,
        null,
        null,
        null,
        null,
        $signature,
        null,
      )];
    }
    invariant(
      $signature is LambdaSignature,
      'Unexpected lambda, expected `$s ==> ...`, or `(...) ==> ..., but got %s',
      \get_class($signature),
    );
    $parameters = $signature->getParameters()?->getChildrenOfItems() ?? vec[];

    // Parameters are either ParameterDeclaration or VairableParameter.
    // VairableParameter is not the `(Type ... $name)` variant, but the long dead `(...)` variant.
    // It is a Hack error to use it and it is not possible to access the values.
    // Let's bail whenever we see one of them.
    $valid_parameters = vec[];
    foreach ($parameters as $p) {
      if ($p is ParameterDeclaration) {
        $valid_parameters[] = $p;
      } else {
        invariant(
          $p is VariadicParameter,
          'Expected defunct variadic parameter type, got %s',
          \get_class($p),
        );
        return null;
      }
    }
    return $valid_parameters;
  }

  private static function parameterDisqualifiesCall(
    ParameterDeclaration $parameter,
  ): bool {
    // You can not take a function reference of functions with a non-default call convention (inout).
    // Tracking inoutness of arguments as well /could/ allow for emitting errors for: `(inout $x) ==> $f(inout $x)`,
    // but this is one more layer of complexity and this linter is already quite complex.
    // Let's disqualify inout lambdas outright.
    return $parameter->hasCallConvention() ||
      $parameter->hasDefaultValue() ||
      // If the parameter is decorated with something other than `...`, it is not a variadic parameter.
      // The rest of this linter assumes that decorated parameters are variadic.
      !(
        $parameter->getName() ?as DecoratedExpression?->getDecorator()
          is ?DotDotDotToken
      );
  }

  private static function argumentIsPlainVariableOrSpreadVariable(
    Node $argument,
  ): bool {
    return $argument is VariableExpression ||
      (
        $argument is DecoratedExpression &&
        $argument->getDecorator() is DotDotDotToken &&
        $argument->getExpression() is VariableExpression
      );
  }

  private static function getErrorMessageForReceiver(Node $receiver): string {
    return $receiver is VariableExpression
      ? static::CALLING_VAR.' '.$receiver->getExpression() as Token->getText()
      : static::CALLING_FUNC.' '.$receiver->getCode().'<>';
  }
}
