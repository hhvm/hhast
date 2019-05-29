/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<63cdc7100dc8dc828d90a89adb93d805>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class EndOfFile extends Node {

  const string SYNTAX_KIND = 'end_of_file';

  private Node $_token;

  public function __construct(
    Node $token,
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
    $token = Node::fromJSON(
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'token' => $this->_token,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $token = $rewriter($this->_token, $parents);
    if ($token === $this->_token) {
      return $this;
    }
    return new static($token);
  }

  public function getTokenUNTYPED(): Node {
    return $this->_token;
  }

  public function withToken(Node $value): this {
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
