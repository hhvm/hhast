/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8aa37b8c5132b62f564720cb7b3d53a2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ListItem extends Node {

  const string SYNTAX_KIND = 'list_item';

  private Node $_item;
  private Node $_separator;

  public function __construct(
    Node $item,
    Node $separator,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_item = $item;
    $this->_separator = $separator;
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
    $item = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['list_item'],
      $file,
      $offset,
      $source,
    );
    $offset += $item->getWidth();
    $separator = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['list_separator'],
      $file,
      $offset,
      $source,
    );
    $offset += $separator->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($item, $separator, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'item' => $this->_item,
      'separator' => $this->_separator,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $item = $rewriter($this->_item, $parents);
    $separator = $rewriter($this->_separator, $parents);
    if ($item === $this->_item && $separator === $this->_separator) {
      return $this;
    }
    return new static($item, $separator);
  }

  public function getItemUNTYPED(): Node {
    return $this->_item;
  }

  public function withItem(Node $value): this {
    if ($value === $this->_item) {
      return $this;
    }
    return new static($value, $this->_separator);
  }

  public function hasItem(): bool {
    return !$this->_item->isMissing();
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | ClassnameTypeSpecifier |
   * ClosureParameterTypeSpecifier | ClosureTypeSpecifier |
   * CollectionLiteralExpression | ConditionalExpression | ConstantDeclarator |
   * ConstructorCall | DarrayIntrinsicExpression | DarrayTypeSpecifier |
   * DecoratedExpression | DictionaryIntrinsicExpression |
   * DictionaryTypeSpecifier | ElementInitializer | EmptyExpression |
   * EvalExpression | FieldInitializer | FieldSpecifier |
   * FunctionCallExpression | GenericTypeSpecifier | InstanceofExpression |
   * IsExpression | IssetExpression | KeysetIntrinsicExpression |
   * KeysetTypeSpecifier | LambdaExpression | LikeTypeSpecifier |
   * ListExpression | LiteralExpression | MapArrayTypeSpecifier |
   * MemberSelectionExpression | null | NamespaceUseClause |
   * NullableTypeSpecifier | ObjectCreationExpression | ParameterDeclaration |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | PropertyDeclarator | QualifiedName |
   * SafeMemberSelectionExpression | ScopeResolutionExpression |
   * ShapeExpression | ShapeTypeSpecifier | SimpleTypeSpecifier |
   * SoftTypeSpecifier | SubscriptExpression | NameToken | VariableToken |
   * TraitUseAliasItem | TraitUsePrecedenceItem | TupleExpression |
   * TupleTypeSpecifier | TypeConstant | TypeParameter | VariableExpression |
   * VariadicParameter | VarrayIntrinsicExpression | VarrayTypeSpecifier |
   * VectorArrayTypeSpecifier | VectorIntrinsicExpression | VectorTypeSpecifier
   * | WhereConstraint | XHPClassAttribute | XHPExpression |
   * XHPSimpleClassAttribute
   */
  public function getItem(): ?Node {
    if ($this->_item->isMissing()) {
      return null;
    }
    return $this->_item;
  }

  /**
   * @return AnonymousFunction | ArrayCreationExpression |
   * ArrayIntrinsicExpression | AsExpression | AwaitableCreationExpression |
   * BinaryExpression | CastExpression | ClassnameTypeSpecifier |
   * ClosureParameterTypeSpecifier | ClosureTypeSpecifier |
   * CollectionLiteralExpression | ConditionalExpression | ConstantDeclarator |
   * ConstructorCall | DarrayIntrinsicExpression | DarrayTypeSpecifier |
   * DecoratedExpression | DictionaryIntrinsicExpression |
   * DictionaryTypeSpecifier | ElementInitializer | EmptyExpression |
   * EvalExpression | FieldInitializer | FieldSpecifier |
   * FunctionCallExpression | GenericTypeSpecifier | InstanceofExpression |
   * IsExpression | IssetExpression | KeysetIntrinsicExpression |
   * KeysetTypeSpecifier | LambdaExpression | LikeTypeSpecifier |
   * ListExpression | LiteralExpression | MapArrayTypeSpecifier |
   * MemberSelectionExpression | NamespaceUseClause | NullableTypeSpecifier |
   * ObjectCreationExpression | ParameterDeclaration | ParenthesizedExpression
   * | PipeVariableExpression | PostfixUnaryExpression | PrefixUnaryExpression
   * | PropertyDeclarator | QualifiedName | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | ShapeExpression | ShapeTypeSpecifier |
   * SimpleTypeSpecifier | SoftTypeSpecifier | SubscriptExpression | NameToken
   * | VariableToken | TraitUseAliasItem | TraitUsePrecedenceItem |
   * TupleExpression | TupleTypeSpecifier | TypeConstant | TypeParameter |
   * VariableExpression | VariadicParameter | VarrayIntrinsicExpression |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorIntrinsicExpression
   * | VectorTypeSpecifier | WhereConstraint | XHPClassAttribute |
   * XHPExpression | XHPSimpleClassAttribute
   */
  public function getItemx(): Node {
    return TypeAssert\not_null($this->getItem());
  }

  public function getSeparatorUNTYPED(): Node {
    return $this->_separator;
  }

  public function withSeparator(Node $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new static($this->_item, $value);
  }

  public function hasSeparator(): bool {
    return !$this->_separator->isMissing();
  }

  /**
   * @return null | CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparator(): ?Token {
    if ($this->_separator->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(Token::class, $this->_separator);
  }

  /**
   * @return CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparatorx(): Token {
    return TypeAssert\not_null($this->getSeparator());
  }
}
