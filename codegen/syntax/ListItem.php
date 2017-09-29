<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b3a4ffc711f6e1031ade44f02b9a2d56>>
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
  public function getChildren(): KeyedTraversable<string, EditableNode> {
    return dict[
      'item' => $this->_item,
      'separator' => $this->_separator,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableNode> $parents = null,
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
   * @returns ParameterDeclaration | BinaryExpression | VariableExpression |
   * LiteralExpression | ArrayIntrinsicExpression | ElementInitializer |
   * PropertyDeclarator | IssetExpression | MemberSelectionExpression |
   * EmptyExpression | PrefixUnaryExpression | ObjectCreationExpression |
   * SimpleTypeSpecifier | FunctionCallExpression | QualifiedNameExpression |
   * VariableToken | StaticDeclarator | PostfixUnaryExpression |
   * ParenthesizedExpression | CollectionLiteralExpression |
   * SubscriptExpression | Attribute | ArrayCreationExpression |
   * ScopeResolutionExpression | ConditionalExpression | CastExpression |
   * InstanceofExpression | NamespaceUseClause | ConstantDeclarator |
   * VectorIntrinsicExpression | DictionaryIntrinsicExpression |
   * KeysetIntrinsicExpression | AnonymousFunction | TypeParameter |
   * GenericTypeSpecifier | LambdaExpression | PipeVariableExpression |
   * DictionaryTypeSpecifier | ListExpression | InclusionExpression |
   * EvalExpression | VariadicParameter | NullableTypeSpecifier |
   * TupleTypeSpecifier | ClosureTypeSpecifier | XHPExpression |
   * XHPClassAttribute | FieldSpecifier | FieldInitializer | ShapeExpression |
   * WhereConstraint | Missing | VectorArrayTypeSpecifier |
   * AwaitableCreationExpression | DecoratedExpression | LeftBraceToken |
   * TypeConstant | DefineExpression | VectorTypeSpecifier |
   * VarrayIntrinsicExpression | DarrayIntrinsicExpression |
   * XHPCategoryNameToken | ColonColonToken | SafeMemberSelectionExpression |
   * NamespacePrefixToken | TupleExpression | SoftTypeSpecifier |
   * TraitUseConflictResolutionItem | ShapeTypeSpecifier |
   * MapArrayTypeSpecifier | ClassnameTypeSpecifier | LessThanLessThanToken |
   * NoreturnToken | XHPSimpleClassAttribute
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
   * @returns CommaToken | Missing | SemicolonToken
   */
  public function getSeparator(): ?EditableToken {
    if ($this->_separator->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_separator);
  }

  /**
   * @returns CommaToken | SemicolonToken
   */
  public function getSeparatorx(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_separator);
  }
}
