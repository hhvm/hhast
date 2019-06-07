/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<44c099a88227667432fb6ffb346c8502>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ErrorSyntax extends Node {

  const string SYNTAX_KIND = 'error';

  private Node $_error;

  public function __construct(
    Node $error,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_error = $error;
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
    $error = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['error_error'],
      $file,
      $offset,
      $source,
      'Node',
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
  public function getChildren(): dict<string, Node> {
    return dict[
      'error' => $this->_error,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $error = $rewriter($this->_error, $parents);
    if ($error === $this->_error) {
      return $this;
    }
    return new static($error);
  }

  public function getErrorUNTYPED(): Node {
    return $this->_error;
  }

  public function withError(Node $value): this {
    if ($value === $this->_error) {
      return $this;
    }
    return new static($value);
  }

  public function hasError(): bool {
    return !$this->_error->isMissing();
  }

  /**
   * @return unknown
   */
  public function getError(): Node {
    return $this->_error;
  }

  /**
   * @return unknown
   */
  public function getErrorx(): Node {
    return $this->getError();
  }
}
