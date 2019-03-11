<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2601b19293329ebfe91fe11ef4caf62c>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class ListItem extends EditableNode {

  private EditableNode $_item;
  private EditableNode $_separator;

  public function __construct(EditableNode $item, EditableNode $separator) {
    parent::__construct('list_item');
    $this->_item = $item;
    $this->_separator = $separator;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $item = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['list_item'],
      $file,
      $offset,
      $source,
    );
    $offset += $item->getWidth();
    $separator = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['list_separator'],
      $file,
      $offset,
      $source,
    );
    $offset += $separator->getWidth();
    return new static($item, $separator);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'item' => $this->_item,
      'separator' => $this->_separator,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $item = $this->_item->rewrite($rewriter, $parents);
    $separator = $this->_separator->rewrite($rewriter, $parents);
    if ($item === $this->_item && $separator === $this->_separator) {
      return $this;
    }
    return new static($item, $separator);
  }

  public function getItemUNTYPED(): EditableNode {
    return $this->_item;
  }

  public function withItem(EditableNode $value): this {
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
   * FunctionCallExpression | FunctionCallWithTypeArgumentsExpression |
   * GenericTypeSpecifier | InstanceofExpression | IsExpression |
   * IssetExpression | KeysetIntrinsicExpression | KeysetTypeSpecifier |
   * LambdaExpression | ListExpression | LiteralExpression |
   * MapArrayTypeSpecifier | MemberSelectionExpression | null |
   * NamespaceUseClause | NullableTypeSpecifier | ObjectCreationExpression |
   * ParameterDeclaration | ParenthesizedExpression | PipeVariableExpression |
   * PostfixUnaryExpression | PrefixUnaryExpression | PropertyDeclarator |
   * QualifiedName | ReifiedTypeArgument | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | ShapeExpression | ShapeTypeSpecifier |
   * SimpleTypeSpecifier | SoftTypeSpecifier | StaticDeclarator |
   * SubscriptExpression | AsToken | ConstToken | NameToken | ReturnToken |
   * VariableToken | TraitUseAliasItem | TraitUsePrecedenceItem |
   * TupleExpression | TupleTypeSpecifier | TypeConstant | TypeParameter |
   * VariableExpression | VariadicParameter | VarrayIntrinsicExpression |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorIntrinsicExpression
   * | VectorTypeSpecifier | WhereConstraint | XHPClassAttribute |
   * XHPExpression | XHPSimpleClassAttribute
   */
  public function getItem(): ?EditableNode {
    if ($this->_item->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableNode::class, $this->_item);
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
   * FunctionCallExpression | FunctionCallWithTypeArgumentsExpression |
   * GenericTypeSpecifier | InstanceofExpression | IsExpression |
   * IssetExpression | KeysetIntrinsicExpression | KeysetTypeSpecifier |
   * LambdaExpression | ListExpression | LiteralExpression |
   * MapArrayTypeSpecifier | MemberSelectionExpression | NamespaceUseClause |
   * NullableTypeSpecifier | ObjectCreationExpression | ParameterDeclaration |
   * ParenthesizedExpression | PipeVariableExpression | PostfixUnaryExpression
   * | PrefixUnaryExpression | PropertyDeclarator | QualifiedName |
   * ReifiedTypeArgument | SafeMemberSelectionExpression |
   * ScopeResolutionExpression | ShapeExpression | ShapeTypeSpecifier |
   * SimpleTypeSpecifier | SoftTypeSpecifier | StaticDeclarator |
   * SubscriptExpression | AsToken | ConstToken | NameToken | ReturnToken |
   * VariableToken | TraitUseAliasItem | TraitUsePrecedenceItem |
   * TupleExpression | TupleTypeSpecifier | TypeConstant | TypeParameter |
   * VariableExpression | VariadicParameter | VarrayIntrinsicExpression |
   * VarrayTypeSpecifier | VectorArrayTypeSpecifier | VectorIntrinsicExpression
   * | VectorTypeSpecifier | WhereConstraint | XHPClassAttribute |
   * XHPExpression | XHPSimpleClassAttribute
   */
  public function getItemx(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_item);
  }

  public function getSeparatorUNTYPED(): EditableNode {
    return $this->_separator;
  }

  public function withSeparator(EditableNode $value): this {
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
  public function getSeparator(): ?EditableToken {
    if ($this->_separator->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_separator);
  }

  /**
   * @return CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparatorx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_separator);
  }
}
