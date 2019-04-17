<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2404b38c6f53a204f4072a4b41075120>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class LikeTypeSpecifier extends EditableNode {

  private EditableNode $_tilde;
  private EditableNode $_type;

  public function __construct(EditableNode $tilde, EditableNode $type) {
    parent::__construct('like_type_specifier');
    $this->_tilde = $tilde;
    $this->_type = $type;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $tilde = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['like_tilde'],
      $file,
      $offset,
      $source,
    );
    $offset += $tilde->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['like_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    return new static($tilde, $type);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'tilde' => $this->_tilde,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $tilde = $this->_tilde->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    if ($tilde === $this->_tilde && $type === $this->_type) {
      return $this;
    }
    return new static($tilde, $type);
  }

  public function getTildeUNTYPED(): EditableNode {
    return $this->_tilde;
  }

  public function withTilde(EditableNode $value): this {
    if ($value === $this->_tilde) {
      return $this;
    }
    return new static($value, $this->_type);
  }

  public function hasTilde(): bool {
    return !$this->_tilde->isMissing();
  }

  /**
   * @return TildeToken
   */
  public function getTilde(): TildeToken {
    return TypeAssert\instance_of(TildeToken::class, $this->_tilde);
  }

  /**
   * @return TildeToken
   */
  public function getTildex(): TildeToken {
    return $this->getTilde();
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_tilde, $value);
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getType(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return $this->getType();
  }
}
