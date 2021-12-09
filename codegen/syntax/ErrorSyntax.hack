/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5bed80736f100a1252edf023be0d0855>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class ErrorSyntax extends Node {

  const string SYNTAX_KIND = 'error';

  private ?Node $_error;

  public function __construct(
    ?Node $error,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_error = $error;
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
    $error = Node::fromJSON(
      ($json['error_error'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Node',
    );
    $offset += $error?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(/* HH_IGNORE_ERROR[4110] */ $error, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'error' => $this->_error,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $error = $this->_error === null ? null : $rewriter($this->_error, $parents);
    if ($error === $this->_error) {
      return $this;
    }
    return new static($error as ?Node);
  }

  public function getErrorUNTYPED(): ?Node {
    return $this->_error;
  }

  public function withError(?Node $value): this {
    if ($value === $this->_error) {
      return $this;
    }
    return new static($value);
  }

  public function hasError(): bool {
    return $this->_error !== null;
  }

  /**
   * @return unknown
   */
  public function getError(): ?Node {
    return $this->_error;
  }

  /**
   * @return unknown
   */
  public function getErrorx(): Node {
    return TypeAssert\not_null($this->getError());
  }
}
