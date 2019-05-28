/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c95172cd7231370b857a5a4ac65781a2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class LetStatement extends EditableNode implements IStatement {

  const string SYNTAX_KIND = 'let_statement';

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
    $keyword = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['let_statement_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $name = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['let_statement_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $colon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['let_statement_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $type = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['let_statement_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $initializer = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['let_statement_initializer'],
      $file,
      $offset,
      $source,
    );
    $offset += $initializer->getWidth();
    $semicolon = EditableNode::fromJSON(
      /* HH_FIXME[4110] */ $json['let_statement_semicolon'],
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
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $name = $rewriter($this->_name, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $type = $rewriter($this->_type, $parents);
    $initializer = $rewriter($this->_initializer, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
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
   * @return
   */
  public function getKeyword(): EditableNode {
    return $this->_keyword;
  }

  /**
   * @return
   */
  public function getKeywordx(): EditableNode {
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
   * @return
   */
  public function getName(): EditableNode {
    return $this->_name;
  }

  /**
   * @return
   */
  public function getNamex(): EditableNode {
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
   * @return
   */
  public function getColon(): EditableNode {
    return $this->_colon;
  }

  /**
   * @return
   */
  public function getColonx(): EditableNode {
    return $this->getColon();
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
   * @return
   */
  public function getType(): EditableNode {
    return $this->_type;
  }

  /**
   * @return
   */
  public function getTypex(): EditableNode {
    return $this->getType();
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
   * @return
   */
  public function getInitializer(): EditableNode {
    return $this->_initializer;
  }

  /**
   * @return
   */
  public function getInitializerx(): EditableNode {
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
   * @return
   */
  public function getSemicolon(): EditableNode {
    return $this->_semicolon;
  }

  /**
   * @return
   */
  public function getSemicolonx(): EditableNode {
    return $this->getSemicolon();
  }
}
