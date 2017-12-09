<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c10d51bb721de15b6c236f4dcb2f8f3f>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class ErrorSyntax extends EditableNode {

  private EditableNode $_error;

  public function __construct(EditableNode $error) {
    parent::__construct('error');
    $this->_error = $error;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $error = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['error_error'],
      $file,
      $offset,
      $source,
    );
    $offset += $error->getWidth();
    return new self($error);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'error' => $this->_error,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $error = $this->_error->rewrite($rewriter, $parents);
    if ($error === $this->_error) {
      return $this;
    }
    return new self($error);
  }

  public function getErrorUNTYPED(): EditableNode {
    return $this->_error;
  }

  public function withError(EditableNode $value): this {
    if ($value === $this->_error) {
      return $this;
    }
    return new self($value);
  }

  public function hasError(): bool {
    return !$this->_error->isMissing();
  }

  /**
   * @returns LeftParenToken | VariableToken | LessThanToken | NameToken |
   * CommaToken | GreaterThanToken | RightParenToken | LeftBraceToken |
   * ObjectToken | RightBraceToken | FunctionToken | PlusPlusToken |
   * SemicolonToken | ListToken | EqualToken | AwaitToken | NewToken |
   * MinusGreaterThanToken | PlusToken | DecimalLiteralToken | ReturnToken |
   * VarToken | ColonColonToken | EchoToken | DotToken |
   * DoubleQuotedStringLiteralHeadToken | QualifiedNameToken | AsToken |
   * MinusToken | FloatToken | EnumToken | StaticToken | ShapeToken |
   * NamespaceToken | SelfToken | ParentToken | IntToken
   */
  public function getError(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_error);
  }
}
