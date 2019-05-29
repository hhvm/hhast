/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<97f5ac934d64067749256e4508a115e8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class RequireClause extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'require_clause';

  private Node $_keyword;
  private Node $_kind;
  private Node $_name;
  private Node $_semicolon;

  public function __construct(
    Node $keyword,
    Node $kind,
    Node $name,
    Node $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_kind = $kind;
    $this->_name = $name;
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
    $keyword = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['require_keyword'],
      $file,
      $offset,
      $source,
    );
    $offset += $keyword->getWidth();
    $kind = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['require_kind'],
      $file,
      $offset,
      $source,
    );
    $offset += $kind->getWidth();
    $name = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['require_name'],
      $file,
      $offset,
      $source,
    );
    $offset += $name->getWidth();
    $semicolon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['require_semicolon'],
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
    return new static($keyword, $kind, $name, $semicolon, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'kind' => $this->_kind,
      'name' => $this->_name,
      'semicolon' => $this->_semicolon,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $kind = $rewriter($this->_kind, $parents);
    $name = $rewriter($this->_name, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $kind === $this->_kind &&
      $name === $this->_name &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static($keyword, $kind, $name, $semicolon);
  }

  public function getKeywordUNTYPED(): Node {
    return $this->_keyword;
  }

  public function withKeyword(Node $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_kind, $this->_name, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @return RequireToken
   */
  public function getKeyword(): RequireToken {
    return TypeAssert\instance_of(RequireToken::class, $this->_keyword);
  }

  /**
   * @return RequireToken
   */
  public function getKeywordx(): RequireToken {
    return $this->getKeyword();
  }

  public function getKindUNTYPED(): Node {
    return $this->_kind;
  }

  public function withKind(Node $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_name, $this->_semicolon);
  }

  public function hasKind(): bool {
    return !$this->_kind->isMissing();
  }

  /**
   * @return ExtendsToken | ImplementsToken
   */
  public function getKind(): Token {
    return TypeAssert\instance_of(Token::class, $this->_kind);
  }

  /**
   * @return ExtendsToken | ImplementsToken
   */
  public function getKindx(): Token {
    return $this->getKind();
  }

  public function getNameUNTYPED(): Node {
    return $this->_name;
  }

  public function withName(Node $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getName(): ISimpleCreationSpecifier {
    return TypeAssert\instance_of(
      ISimpleCreationSpecifier::class,
      $this->_name,
    );
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getNamex(): ISimpleCreationSpecifier {
    return $this->getName();
  }

  public function getSemicolonUNTYPED(): Node {
    return $this->_semicolon;
  }

  public function withSemicolon(Node $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_kind, $this->_name, $value);
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
