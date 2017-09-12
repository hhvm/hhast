<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0517f7ff1668641c75ab8bf5afb25813>>
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
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $open = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_open'],
      $position,
      $source,
    );
    $position += $open->width();
    $body = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_body'],
      $position,
      $source,
    );
    $position += $body->width();
    $close = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['xhp_close'],
      $position,
      $source,
    );
    $position += $close->width();
    return new self($open, $body, $close);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'open' => $this->_open;
    yield 'body' => $this->_body;
    yield 'close' => $this->_close;
  }

  <<__Override>>
  public function rewrite_children(
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
    return !$this->_open->is_missing();
  }

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
    return !$this->_body->is_missing();
  }

  public function getBody(): ?EditableList {
    if ($this->_body->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(EditableList::class, $this->_body);
  }

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
    return !$this->_close->is_missing();
  }

  public function getClose(): ?XHPClose {
    if ($this->_close->is_missing()) {
      return null;
    }
    return TypeAssert::isInstanceOf(XHPClose::class, $this->_close);
  }

  public function getClosex(): XHPClose {
    return TypeAssert::isInstanceOf(XHPClose::class, $this->_close);
  }
}
