/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6c2c59e287262684c0db43806a928782>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPExpression
  extends EditableNode
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'xhp_expression';

  private EditableNode $_open;
  private EditableNode $_body;
  private EditableNode $_close;

  public function __construct(
    EditableNode $open,
    EditableNode $body,
    EditableNode $close,
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
    $open = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_open'],
      $file,
      $offset,
      $source,
    );
    $offset += $open->getWidth();
    $body = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['xhp_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    $close = EditableNode::fromJSON(
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'open' => $this->_open,
      'body' => $this->_body,
      'close' => $this->_close,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
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

  public function getOpenUNTYPED(): EditableNode {
    return $this->_open;
  }

  public function withOpen(EditableNode $value): this {
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

  public function getBodyUNTYPED(): EditableNode {
    return $this->_body;
  }

  public function withBody(EditableNode $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static($this->_open, $value, $this->_close);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @return EditableList<EditableNode> | null
   */
  public function getBody(): ?EditableList<EditableNode> {
    if ($this->_body->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_body);
  }

  /**
   * @return EditableList<EditableNode>
   */
  public function getBodyx(): EditableList<EditableNode> {
    return TypeAssert\not_null($this->getBody());
  }

  public function getCloseUNTYPED(): EditableNode {
    return $this->_close;
  }

  public function withClose(EditableNode $value): this {
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
