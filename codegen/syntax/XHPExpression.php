<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<ec7fa5c8343c5bd83955880b08e6e430>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class XHPExpression extends EditableNode {

  private EditableNode $_open;
  private EditableNode $_body;
  private EditableNode $_close;

  public function __construct(
    EditableNode $open,
    EditableNode $body,
    EditableNode $close,
  ) {
    parent::__construct('xhp_expression');
    $this->_open = $open;
    $this->_body = $body;
    $this->_close = $close;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $open = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open'],
      $file,
      $offset,
      $source,
    );
    $offset += $open->getWidth();
    $body = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_body'],
      $file,
      $offset,
      $source,
    );
    $offset += $body->getWidth();
    $close = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_close'],
      $file,
      $offset,
      $source,
    );
    $offset += $close->getWidth();
    return new static($open, $body, $close);
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
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $open = $this->_open->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    $close = $this->_close->rewrite($rewriter, $parents);
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
   * @returns XHPOpen
   */
  public function getOpen(): XHPOpen {
    return TypeAssert\instance_of(XHPOpen::class, $this->_open);
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
   * @returns Missing | EditableList
   */
  public function getBody(): ?EditableList {
    if ($this->_body->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableList::class, $this->_body);
  }

  /**
   * @returns EditableList
   */
  public function getBodyx(): EditableList {
    return TypeAssert\instance_of(EditableList::class, $this->_body);
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
   * @returns Missing | XHPClose
   */
  public function getClose(): ?XHPClose {
    if ($this->_close->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(XHPClose::class, $this->_close);
  }

  /**
   * @returns XHPClose
   */
  public function getClosex(): XHPClose {
    return TypeAssert\instance_of(XHPClose::class, $this->_close);
  }
}
