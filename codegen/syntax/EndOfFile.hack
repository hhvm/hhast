/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<3462ef6cbb50c239582cdb4322561787>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class EndOfFile extends Node {

  const string SYNTAX_KIND = 'end_of_file';

  private EndOfFileToken $_token;

  public function __construct(
    EndOfFileToken $token,
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
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $token = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['end_of_file_token'],
      $file,
      $offset,
      $source,
      'EndOfFileToken',
    );
    $token = $token as nonnull;
    $offset += $token->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(/* HH_IGNORE_ERROR[4110] */ $token, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'token' => $this->_token,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $token = $rewriter($this->_token, $parents);
    if ($token === $this->_token) {
      return $this;
    }
    return new static(/* HH_FIXME[4110] use `as` */ $token);
  }

  public function getTokenUNTYPED(): ?Node {
    return $this->_token;
  }

  public function withToken(EndOfFileToken $value): this {
    if ($value === $this->_token) {
      return $this;
    }
    return new static($value);
  }

  public function hasToken(): bool {
    return $this->_token !== null;
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
