/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<29d5388bdd052b39f124825c2b08a834>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class FieldSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'field_specifier';

  private ?QuestionToken $_question;
  private IExpression $_name;
  private EqualGreaterThanToken $_arrow;
  private ITypeSpecifier $_type;

  public function __construct(
    ?QuestionToken $question,
    IExpression $name,
    EqualGreaterThanToken $arrow,
    ITypeSpecifier $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_question = $question;
    $this->_name = $name;
    $this->_arrow = $arrow;
    $this->_type = $type;
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
    $question = Node::fromJSON(
      ($json['field_question'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'QuestionToken',
    );
    $offset += $question?->getWidth() ?? 0;
    $name = Node::fromJSON(
      ($json['field_name']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $name = $name as nonnull;
    $offset += $name->getWidth();
    $arrow = Node::fromJSON(
      ($json['field_arrow']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'EqualGreaterThanToken',
    );
    $arrow = $arrow as nonnull;
    $offset += $arrow->getWidth();
    $type = Node::fromJSON(
      ($json['field_type']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'ITypeSpecifier',
    );
    $type = $type as nonnull;
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $question,
      /* HH_IGNORE_ERROR[4110] */ $name,
      /* HH_IGNORE_ERROR[4110] */ $arrow,
      /* HH_IGNORE_ERROR[4110] */ $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'question' => $this->_question,
      'name' => $this->_name,
      'arrow' => $this->_arrow,
      'type' => $this->_type,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $question =
      $this->_question === null ? null : $rewriter($this->_question, $parents);
    $name = $rewriter($this->_name, $parents);
    $arrow = $rewriter($this->_arrow, $parents);
    $type = $rewriter($this->_type, $parents);
    if (
      $question === $this->_question &&
      $name === $this->_name &&
      $arrow === $this->_arrow &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static(
      $question as ?QuestionToken,
      $name as IExpression,
      $arrow as EqualGreaterThanToken,
      $type as ITypeSpecifier,
    );
  }

  public function getQuestionUNTYPED(): ?Node {
    return $this->_question;
  }

  public function withQuestion(?QuestionToken $value): this {
    if ($value === $this->_question) {
      return $this;
    }
    return new static($value, $this->_name, $this->_arrow, $this->_type);
  }

  public function hasQuestion(): bool {
    return $this->_question !== null;
  }

  /**
   * @return null | QuestionToken
   */
  public function getQuestion(): ?QuestionToken {
    return $this->_question;
  }

  /**
   * @return QuestionToken
   */
  public function getQuestionx(): QuestionToken {
    return TypeAssert\not_null($this->getQuestion());
  }

  public function getNameUNTYPED(): ?Node {
    return $this->_name;
  }

  public function withName(IExpression $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new static($this->_question, $value, $this->_arrow, $this->_type);
  }

  public function hasName(): bool {
    return true;
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression
   */
  public function getName(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_name);
  }

  /**
   * @return LiteralExpression | ScopeResolutionExpression
   */
  public function getNamex(): IExpression {
    return $this->getName();
  }

  public function getArrowUNTYPED(): ?Node {
    return $this->_arrow;
  }

  public function withArrow(EqualGreaterThanToken $value): this {
    if ($value === $this->_arrow) {
      return $this;
    }
    return new static($this->_question, $this->_name, $value, $this->_type);
  }

  public function hasArrow(): bool {
    return true;
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrow(): EqualGreaterThanToken {
    return TypeAssert\instance_of(EqualGreaterThanToken::class, $this->_arrow);
  }

  /**
   * @return EqualGreaterThanToken
   */
  public function getArrowx(): EqualGreaterThanToken {
    return $this->getArrow();
  }

  public function getTypeUNTYPED(): ?Node {
    return $this->_type;
  }

  public function withType(ITypeSpecifier $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static($this->_question, $this->_name, $this->_arrow, $value);
  }

  public function hasType(): bool {
    return true;
  }

  /**
   * @return AttributizedSpecifier | ClosureTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | NullableTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getType(): ITypeSpecifier {
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return AttributizedSpecifier | ClosureTypeSpecifier |
   * DictionaryTypeSpecifier | GenericTypeSpecifier | NullableTypeSpecifier |
   * ShapeTypeSpecifier | SimpleTypeSpecifier | TupleTypeSpecifier |
   * TypeConstant | VarrayTypeSpecifier | VectorTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return $this->getType();
  }
}
