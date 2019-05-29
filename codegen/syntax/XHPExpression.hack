/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<307328eb4b268f49ecd982a5c447bc34>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'xhp_expression';

  private Node $_open;
  private Node $_body;
  private Node $_close;

  public function __construct(
    Node $open,
    Node $body,
    Node $close,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_open = $open;
    $this->_body = $body;
    $this->_close = $close;
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
    $open = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open'],
      $file,
      $offset,
      $source,
    );
    $offset += $open->getWidth();
    $body = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    $close = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_close'],
      $file,
      $offset,
      $source,
    );
    $offset += $close->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($open, $body, $close, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'open' => $this->_open,
      'body' => $this->_body,
      'close' => $this->_close,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $open = $rewriter($this->_open, $parents);
    $body = $rewriter($this->_body, $parents);
    $close = $rewriter($this->_close, $parents);
    if (
      $open === $this->_open &&
      $body === $this->_body &&
      $close === $this->_close
    ) {
      return $this;
    }
    return new static($open, $body, $close);
  }

  public function getOpenUNTYPED(): Node {
    return $this->_open;
  }

  public function withOpen(Node $value): this {
    if ($value === $this->_open) {
      return $this;
    }
    return new static($value, $this->_body, $this->_close);
  }

  public function hasOpen(): bool {
    return !$this->_open->isMissing();
  }

  /**
   * @return XHPOpen
   */
  public function getOpen(): XHPOpen {
    return TypeAssert\instance_of(XHPOpen::class, $this->_open);
  }

  /**
   * @return XHPOpen
   */
  public function getOpenx(): XHPOpen {
    return $this->getOpen();
  }

  public function getBodyUNTYPED(): Node {
    return $this->_body;
  }

  public function withBody(Node $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static($this->_open, $value, $this->_close);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return NodeList<Node> | null
   */
  public function getBody(): ?NodeList<Node> {
    if ($this->_body->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_body);
  }

  /**
   * @return NodeList<Node>
   */
  public function getBodyx(): NodeList<Node> {
    return TypeAssert\not_null($this->getBody());
  }

  public function getCloseUNTYPED(): Node {
    return $this->_close;
  }

  public function withClose(Node $value): this {
    if ($value === $this->_close) {
      return $this;
    }
    return new static($this->_open, $this->_body, $value);
  }

  public function hasClose(): bool {
    return !$this->_close->isMissing();
  }

  /**
   * @return null | XHPClose
   */
  public function getClose(): ?XHPClose {
    if ($this->_close->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(XHPClose::class, $this->_close);
  }

  /**
   * @return XHPClose
   */
  public function getClosex(): XHPClose {
    return TypeAssert\not_null($this->getClose());
  }
}
