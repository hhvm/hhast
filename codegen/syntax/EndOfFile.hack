/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<e3ed7cc480f3d97dcb5b195cd0c277aa>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EndOfFile extends EditableNode {

  const string SYNTAX_KIND = 'end_of_file';

  private EditableNode $_token;

  public function __construct(
    EditableNode $token,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_token = $token;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $token = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['end_of_file_token'],
      $file,
      $offset,
      $source,
    );
    $offset += $token->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($token, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'token' => $this->_token,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $token = $rewriter($this->_token, $parents);
    if ($token === $this->_token) {
      return $this;
    }
    return new static($token);
  }

  public function getTokenUNTYPED(): EditableNode {
    return $this->_token;
  }

  public function withToken(EditableNode $value): this {
    if ($value === $this->_token) {
      return $this;
    }
    return new static($value);
  }

  public function hasToken(): bool {
    return !$this->_token->isMissing();
  }

  /**
   * @return EndOfFileToken
   */
  public function getToken(): EndOfFileToken {
    return TypeAssert\instance_of(EndOfFileToken::class, $this->_token);
  }

  /**
   * @return EndOfFileToken
   */
  public function getTokenx(): EndOfFileToken {
    return $this->getToken();
  }
}
