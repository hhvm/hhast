/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<826a6631b25eebc933ad97717e787801>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class RequireClause extends Node implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'require_clause';

  private RequireToken $_keyword;
  private Token $_kind;
  private ISimpleCreationSpecifier $_name;
  private SemicolonToken $_semicolon;

  public function __construct(
    RequireToken $keyword,
    Token $kind,
    ISimpleCreationSpecifier $name,
    SemicolonToken $semicolon,
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
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['require_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'RequireToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $kind = Node::fromJSON(
      ($json['require_kind']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'Token',
    );
    $kind = $kind as nonnull;
    $offset += $kind->getWidth();
    $name = Node::fromJSON(
      ($json['require_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ISimpleCreationSpecifier',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $semicolon = Node::fromJSON(
      ($json['require_semicolon']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'SemicolonToken',
    );
    $semicolon = $semicolon as nonnull;
    $offset += $semicolon->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $kind,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $semicolon,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'kind' => $this->_kind,
      'name' => $this->_name,
      'semicolon' => $this->_semicolon,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
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
    return new static(
      $keyword as RequireToken,
      $kind as Token,
      $name as ISimpleCreationSpecifier,
      $semicolon as SemicolonToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(RequireToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_kind, $this->_name, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return true;
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

  public function getKindUNTYPED(): ?Node {
    return $this->_kind;
  }

  public function withKind(Token $value): this {
    if ($value === $this->_kind) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_name, $this->_semicolon);
  }

  public function hasKind(): bool {
    return true;
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

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(ISimpleCreationSpecifier $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_keyword, $this->_kind, $value, $this->_semicolon);
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getName(): ISimpleCreationSpecifier {
    return
      TypeAssert\instance_of(ISimpleCreationSpecifier::class, $this->_name);
  }

  /**
   * @return GenericTypeSpecifier | SimpleTypeSpecifier
   */
  public function getNamex(): ISimpleCreationSpecifier {
    return $this->getName();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_kind, $this->_name, $value);
  }

  public function hasSemicolon(): bool {
    return true;
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
