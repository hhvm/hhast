/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a0de3999fcd54ca07e31e731622f8802>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class LetStatement extends EditableNode {

  private EditableNode $_keyword;
  private EditableNode $_name;
  private EditableNode $_colon;
  private EditableNode $_type;
  private EditableNode $_initializer;
  private EditableNode $_semicolon;

  public function __construct(
    EditableNode $keyword,
    EditableNode $name,
    EditableNode $colon,
    EditableNode $type,
    EditableNode $initializer,
    EditableNode $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_colon = $colon;
    $this->_type = $type;
    $this->_initializer = $initializer;
    $this->_semicolon = $semicolon;
    parent::__construct('let_statement', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $keyword = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['let_statement_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['let_statement_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $colon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['let_statement_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $type = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['let_statement_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $initializer = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['let_statement_initializer'],
      $file,
      $offset,
      $source,
    );
    $offset += $initializer->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['let_statement_semicolon'],
      $file,
      $offset,
      $source,
    );
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $keyword,
      $name,
      $colon,
      $type,
      $initializer,
      $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'keyword' => $this->_keyword,
      'name' => $this->_name,
      'colon' => $this->_colon,
      'type' => $this->_type,
      'initializer' => $this->_initializer,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $colon = $this->_colon->rewrite($rewriter, $parents);
    $type = $this->_type->rewrite($rewriter, $parents);
    $initializer = $this->_initializer->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $colon === $this->_colon &&
      $type === $this->_type &&
      $initializer === $this->_initializer &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $name, $colon, $type, $initializer, $semicolon);
  }

  public function getKeywordUNTYPED(): EditableNode {
    return $this->_keyword;
  }

  public function withKeyword(EditableNode $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static(
      $value,
      $this->_name,
      $this->_colon,
      $this->_type,
      $this->_initializer,
      $this->_semicolon,
    );
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return LetToken
   */
  public function getKeyword(): LetToken {
    return TypeAssert\instance_of(LetToken::class, $this->_keyword);
  }

  /**
   * @return LetToken
   */
  public function getKeywordx(): LetToken {
    return $this->getKeyword();
  }

  public function getNameUNTYPED(): EditableNode {
    return $this->_name;
  }

  public function withName(EditableNode $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $value,
      $this->_colon,
      $this->_type,
      $this->_initializer,
      $this->_semicolon,
    );
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return NameToken
   */
  public function getName(): NameToken {
    return TypeAssert\instance_of(NameToken::class, $this->_name);
  }

  /**
   * @return NameToken
   */
  public function getNamex(): NameToken {
    return $this->getName();
  }

  public function getColonUNTYPED(): EditableNode {
    return $this->_colon;
  }

  public function withColon(EditableNode $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $value,
      $this->_type,
      $this->_initializer,
      $this->_semicolon,
    );
  }

  public function hasColon(): bool {
    return !$this->_colon->isMissing();
  }

  /**
   * @return null | ColonToken
   */
  public function getColon(): ?ColonToken {
    if ($this->_colon->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  /**
   * @return ColonToken
   */
  public function getColonx(): ColonToken {
    return TypeAssert\instance_of(ColonToken::class, $this->_colon);
  }

  public function getTypeUNTYPED(): EditableNode {
    return $this->_type;
  }

  public function withType(EditableNode $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $value,
      $this->_initializer,
      $this->_semicolon,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier | null |
   * NullableTypeSpecifier | SimpleTypeSpecifier
   */
  public function getType(): ?EditableNode {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier |
   * NullableTypeSpecifier | SimpleTypeSpecifier
   */
  public function getTypex(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_type);
  }

  public function getInitializerUNTYPED(): EditableNode {
    return $this->_initializer;
  }

  public function withInitializer(EditableNode $value): this {
    if ($value === $this->_initializer) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_type,
      $value,
      $this->_semicolon,
    );
  }

  public function hasInitializer(): bool {
    return !$this->_initializer->isMissing();
  }

  /**
   * @return SimpleInitializer
   */
  public function getInitializer(): SimpleInitializer {
    return TypeAssert\instance_of(
      SimpleInitializer::class,
      $this->_initializer,
    );
  }

  /**
   * @return SimpleInitializer
   */
  public function getInitializerx(): SimpleInitializer {
    return $this->getInitializer();
  }

  public function getSemicolonUNTYPED(): EditableNode {
    return $this->_semicolon;
  }

  public function withSemicolon(EditableNode $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static(
      $this->_keyword,
      $this->_name,
      $this->_colon,
      $this->_type,
      $this->_initializer,
      $value,
    );
  }

  public function hasSemicolon(): bool {
    return !$this->_semicolon->isMissing();
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolon(): SemicolonToken {
    return TypeAssert\instance_of(SemicolonToken::class, $this->_semicolon);
  }

  /**
   * @return SemicolonToken
   */
  public function getSemicolonx(): SemicolonToken {
    return $this->getSemicolon();
  }
}
