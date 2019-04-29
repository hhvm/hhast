/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3f6dbda4679c63080d869c75a59164c8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ErrorSyntax extends EditableNode {

  private EditableNode $_error;

  public function __construct(
    EditableNode $error,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_error = $error;
    parent::__construct('error', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $error = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['error_error'],
      $file,
      $offset,
      $source,
    );
    $offset += $error->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($error, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'error' => $this->_error,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $error = $rewriter($this->_error, $parents);
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
   * @return AmpersandToken | RightParenToken | CommaToken | SemicolonToken |
   * EqualToken | EqualGreaterThanToken | BackslashToken | DecimalLiteralToken
   * | InoutToken | IntToken | NameToken | SingleQuotedStringLiteralToken |
   * StaticToken | UsingToken | VariableToken | LeftBraceToken | RightBraceToken
   */
  public function getError(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_error);
  }

  /**
   * @return AmpersandToken | RightParenToken | CommaToken | SemicolonToken |
   * EqualToken | EqualGreaterThanToken | BackslashToken | DecimalLiteralToken
   * | InoutToken | IntToken | NameToken | SingleQuotedStringLiteralToken |
   * StaticToken | UsingToken | VariableToken | LeftBraceToken | RightBraceToken
   */
  public function getErrorx(): EditableToken {
    return $this->getError();
  }
}
