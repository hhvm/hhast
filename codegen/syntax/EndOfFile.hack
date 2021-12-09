/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ee8cf185114a93a8babb028e045c0d84>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $token = Node::fromJSON(
      ($json['end_of_file_token']) as dict<_, _>,
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
    return new static($token as EndOfFileToken);
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
    return true;
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
