<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<6a4fe7f02a8593156d6dfd4857accb89>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    return new self($item, $separator);
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
    return new self($item, $separator);
  }

  public function getItemUNTYPED(): EditableNode {
    return $this->_item;
  }

  public function withItem(EditableNode $value): this {
    if ($value === $this->_item) {
      return $this;
    }
    return new self($value, $this->_separator);
  }

  public function hasItem(): bool {
    return !$this->_item->isMissing();
  }

  /**
   * @returns SimpleTypeSpecifier | XHPClassAttribute | ParameterDeclaration |
   * BinaryExpression | LiteralExpression | FunctionCallExpression |
   * VariableExpression | PropertyDeclarator | ScopeResolutionExpression |
   * SubscriptExpression | PrefixUnaryExpression | PostfixUnaryExpression |
   * ArrayIntrinsicExpression | ElementInitializer | ParenthesizedExpression |
   * VariableToken | FieldSpecifier | FieldInitializer | TypeParameter |
   * Attribute | ShapeExpression | ConstantDeclarator |
   * ObjectCreationExpression | NameToken | LambdaExpression |
   * VectorIntrinsicExpression | CollectionLiteralExpression |
   * MemberSelectionExpression | StaticDeclarator | GenericTypeSpecifier |
   * ClosureParameterTypeSpecifier | InstanceofExpression | WhereConstraint |
   * AnonymousFunction | XHPExpression | CastExpression | IssetExpression |
   * TraitUseAliasItem | EmptyExpression | NullableTypeSpecifier |
   * TupleTypeSpecifier | ClosureTypeSpecifier | ConditionalExpression |
   * ArrayCreationExpression | NamespaceUseClause |
   * DictionaryIntrinsicExpression | KeysetIntrinsicExpression |
   * InclusionExpression | Missing | ListExpression | PipeVariableExpression |
   * QualifiedName | VariadicParameter | DictionaryTypeSpecifier |
   * EvalExpression | DecoratedExpression | VarrayIntrinsicExpression |
   * DarrayIntrinsicExpression | VectorArrayTypeSpecifier | TupleExpression |
   * TraitUsePrecedenceItem | VectorTypeSpecifier | TypeConstant |
   * AwaitableCreationExpression | SafeMemberSelectionExpression |
   * DefineExpression | ShapeTypeSpecifier | XHPCategoryNameToken |
   * NoreturnToken | MapArrayTypeSpecifier | XHPSimpleClassAttribute |
   * ClassnameTypeSpecifier
   */
  public function getItem(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_item);
  }

  public function getSeparatorUNTYPED(): EditableNode {
    return $this->_separator;
  }

  public function withSeparator(EditableNode $value): this {
    if ($value === $this->_separator) {
      return $this;
    }
    return new self($this->_item, $value);
  }

  public function hasSeparator(): bool {
    return !$this->_separator->isMissing();
  }

  /**
   * @returns Missing | CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparator(): ?EditableToken {
    if ($this->_separator->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_separator);
  }

  /**
   * @returns CommaToken | SemicolonToken | BackslashToken
   */
  public function getSeparatorx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_separator);
  }
}
