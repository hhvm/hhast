<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<253f742bdd0ff87a4ef6a98ea419c79e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
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
    return new static($error);
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
    return new static($error);
  }

  public function getErrorUNTYPED(): EditableNode {
    return $this->_error;
  }

  public function withError(EditableNode $value): this {
    if ($value === $this->_error) {
      return $this;
    }
    return new static($value);
  }

  public function hasError(): bool {
    return !$this->_error->isMissing();
  }

  /**
   * @returns SemicolonToken | EqualToken | DecimalLiteralToken | VariableToken
   * | RightBraceToken
   */
  public function getError(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_error);
  }

  /**
   * @returns SemicolonToken | EqualToken | DecimalLiteralToken | VariableToken
   * | RightBraceToken
   */
  public function getErrorx(): EditableToken {
    return $this->getError();
  }
}
