/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<0520fe0589b0a3b3dd679cd9067b78e8>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class XHPClassAttributeDeclaration
  extends Node
  implements IClassBodyDeclaration {

  const string SYNTAX_KIND = 'xhp_class_attribute_declaration';

  private AttributeToken $_keyword;
  private NodeList<ListItem<Node>> $_attributes;
  private SemicolonToken $_semicolon;

  public function __construct(
    AttributeToken $keyword,
    NodeList<ListItem<Node>> $attributes,
    SemicolonToken $semicolon,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_attributes = $attributes;
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
      ($json['xhp_attribute_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'AttributeToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $attributes = Node::fromJSON(
      ($json['xhp_attribute_attributes']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<ListItem<Node>>',
    );
    $attributes = $attributes as nonnull;
    $offset += $attributes->getWidth();
    $semicolon = Node::fromJSON(
      ($json['xhp_attribute_semicolon']) as dict<_, _>,
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
      $keyword as AttributeToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<Node>>>(
        $attributes as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $semicolon as SemicolonToken,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'attributes' => $this->_attributes,
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
    $attributes = $rewriter($this->_attributes, $parents);
    $semicolon = $rewriter($this->_semicolon, $parents);
    if (
      $keyword === $this->_keyword &&
      $attributes === $this->_attributes &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new static(
      $keyword as AttributeToken,
      \HH\FIXME\UNSAFE_CAST<NodeList<Node>, NodeList<ListItem<Node>>>(
        $attributes as NodeList<_>,
        'Open for sound approaches that are not O(n).',
      ),
      $semicolon as SemicolonToken,
    );
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(AttributeToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_attributes, $this->_semicolon);
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return AttributeToken
   */
  public function getKeyword(): AttributeToken {
    return TypeAssert\instance_of(AttributeToken::class, $this->_keyword);
  }

  /**
   * @return AttributeToken
   */
  public function getKeywordx(): AttributeToken {
    return $this->getKeyword();
  }

  public function getAttributesUNTYPED(): ?Node {
    return $this->_attributes;
  }

  public function withAttributes(NodeList<ListItem<Node>> $value): this {
    if ($value === $this->_attributes) {
      return $this;
    }
    return new static($this->_keyword, $value, $this->_semicolon);
  }

  public function hasAttributes(): bool {
    return true;
  }

  /**
   * @return NodeList<ListItem<XHPClassAttribute>> | NodeList<ListItem<Node>> |
   * NodeList<ListItem<XHPSimpleClassAttribute>>
   */
  public function getAttributes(): NodeList<ListItem<Node>> {
    return TypeAssert\instance_of(NodeList::class, $this->_attributes);
  }

  /**
   * @return NodeList<ListItem<XHPClassAttribute>> | NodeList<ListItem<Node>> |
   * NodeList<ListItem<XHPSimpleClassAttribute>>
   */
  public function getAttributesx(): NodeList<ListItem<Node>> {
    return $this->getAttributes();
  }

  public function getSemicolonUNTYPED(): ?Node {
    return $this->_semicolon;
  }

  public function withSemicolon(SemicolonToken $value): this {
    if ($value === $this->_semicolon) {
      return $this;
    }
    return new static($this->_keyword, $this->_attributes, $value);
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
