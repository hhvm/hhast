<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4784ab475e0a800908b3d5c82a3163c7>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class XHPExpression extends EditableSyntax {

  private EditableSyntax $_open;
  private EditableSyntax $_body;
  private EditableSyntax $_close;

  public function __construct(
    EditableSyntax $open,
    EditableSyntax $body,
    EditableSyntax $close,
  ) {
    parent::__construct('xhp_expression');
    $this->_open = $open;
    $this->_body = $body;
    $this->_close = $close;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $open = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_open'],
      $position,
      $source,
    );
    $position += $open->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
    $close = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['xhp_close'],
      $position,
      $source,
    );
    $position += $close->getWidth();
    return new self($open, $body, $close);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'open' => $this->_open;
    yield 'body' => $this->_body;
    yield 'close' => $this->_close;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
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
    return new self($open, $body, $close);
  }

  public function getOpenUNTYPED(): EditableSyntax {
    return $this->_open;
  }

  public function withOpen(EditableSyntax $value): this {
    if ($value === $this->_open) {
      return $this;
    }
    return new self($value, $this->_body, $this->_close);
  }

  public function hasOpen(): bool {
    return !$this->_open->isMissing();
  }

  /**
   * @returns XHPOpen
   */
  public function getOpen(): XHPOpen {
    return TypeAssert::isInstanceOf(XHPOpen::class, $this->_open);
  }

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self($this->_open, $value, $this->_close);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @returns EditableList
   */
  public function getBody(): ?EditableList {
    if ($this->_body->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_body);
  }

  /**
   * @returns EditableList
   */
  public function getBodyx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_body);
  }

  public function getCloseUNTYPED(): EditableSyntax {
    return $this->_close;
  }

  public function withClose(EditableSyntax $value): this {
    if ($value === $this->_close) {
      return $this;
    }
    return new self($this->_open, $this->_body, $value);
  }

  public function hasClose(): bool {
    return !$this->_close->isMissing();
  }

  /**
   * @returns XHPClose
   */
  public function getClose(): ?XHPClose {
    if ($this->_close->isMissing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(XHPClose::class, $this->_close);
  }

  /**
   * @returns XHPClose
   */
  public function getClosex(): XHPClose {
    return TypeAssert::isInstanceOf(XHPClose::class, $this->_close);
  }
}
