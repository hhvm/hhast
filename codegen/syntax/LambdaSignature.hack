/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<c87d3103b23b5df837162c8e3696facd>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class LambdaSignature extends Node implements ILambdaSignature {

  const string SYNTAX_KIND = 'lambda_signature';

  private Node $_left_paren;
  private Node $_parameters;
  private Node $_right_paren;
  private Node $_colon;
  private Node $_type;

  public function __construct(
    Node $left_paren,
    Node $parameters,
    Node $right_paren,
    Node $colon,
    Node $type,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_left_paren = $left_paren;
    $this->_parameters = $parameters;
    $this->_right_paren = $right_paren;
    $this->_colon = $colon;
    $this->_type = $type;
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
    $left_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_left_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $left_paren->getWidth();
    $parameters = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_parameters'],
      $file,
      $offset,
      $source,
    );
    $offset += $parameters->getWidth();
    $right_paren = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_right_paren'],
      $file,
      $offset,
      $source,
    );
    $offset += $right_paren->getWidth();
    $colon = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_colon'],
      $file,
      $offset,
      $source,
    );
    $offset += $colon->getWidth();
    $type = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['lambda_type'],
      $file,
      $offset,
      $source,
    );
    $offset += $type->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $left_paren,
      $parameters,
      $right_paren,
      $colon,
      $type,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'left_paren' => $this->_left_paren,
      'parameters' => $this->_parameters,
      'right_paren' => $this->_right_paren,
      'colon' => $this->_colon,
      'type' => $this->_type,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $left_paren = $rewriter($this->_left_paren, $parents);
    $parameters = $rewriter($this->_parameters, $parents);
    $right_paren = $rewriter($this->_right_paren, $parents);
    $colon = $rewriter($this->_colon, $parents);
    $type = $rewriter($this->_type, $parents);
    if (
      $left_paren === $this->_left_paren &&
      $parameters === $this->_parameters &&
      $right_paren === $this->_right_paren &&
      $colon === $this->_colon &&
      $type === $this->_type
    ) {
      return $this;
    }
    return new static($left_paren, $parameters, $right_paren, $colon, $type);
  }

  public function getLeftParenUNTYPED(): Node {
    return $this->_left_paren;
  }

  public function withLeftParen(Node $value): this {
    if ($value === $this->_left_paren) {
      return $this;
    }
    return new static(
      $value,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
    );
  }

  public function hasLeftParen(): bool {
    return !$this->_left_paren->isMissing();
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParen(): LeftParenToken {
    return TypeAssert\instance_of(LeftParenToken::class, $this->_left_paren);
  }

  /**
   * @return LeftParenToken
   */
  public function getLeftParenx(): LeftParenToken {
    return $this->getLeftParen();
  }

  public function getParametersUNTYPED(): Node {
    return $this->_parameters;
  }

  public function withParameters(Node $value): this {
    if ($value === $this->_parameters) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $value,
      $this->_right_paren,
      $this->_colon,
      $this->_type,
    );
  }

  public function hasParameters(): bool {
    return !$this->_parameters->isMissing();
  }

  /**
   * @return NodeList<ListItem<ParameterDeclaration>> |
   * NodeList<ListItem<VariadicParameter>> | null
   */
  public function getParameters(): ?NodeList<ListItem<IParameter>> {
    if ($this->_parameters->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(NodeList::class, $this->_parameters);
  }

  /**
   * @return NodeList<ListItem<ParameterDeclaration>> |
   * NodeList<ListItem<VariadicParameter>>
   */
  public function getParametersx(): NodeList<ListItem<IParameter>> {
    return TypeAssert\not_null($this->getParameters());
  }

  public function getRightParenUNTYPED(): Node {
    return $this->_right_paren;
  }

  public function withRightParen(Node $value): this {
    if ($value === $this->_right_paren) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $value,
      $this->_colon,
      $this->_type,
    );
  }

  public function hasRightParen(): bool {
    return !$this->_right_paren->isMissing();
  }

  /**
   * @return RightParenToken
   */
  public function getRightParen(): RightParenToken {
    return TypeAssert\instance_of(RightParenToken::class, $this->_right_paren);
  }

  /**
   * @return RightParenToken
   */
  public function getRightParenx(): RightParenToken {
    return $this->getRightParen();
  }

  public function getColonUNTYPED(): Node {
    return $this->_colon;
  }

  public function withColon(Node $value): this {
    if ($value === $this->_colon) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $value,
      $this->_type,
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
    return TypeAssert\not_null($this->getColon());
  }

  public function getTypeUNTYPED(): Node {
    return $this->_type;
  }

  public function withType(Node $value): this {
    if ($value === $this->_type) {
      return $this;
    }
    return new static(
      $this->_left_paren,
      $this->_parameters,
      $this->_right_paren,
      $this->_colon,
      $value,
    );
  }

  public function hasType(): bool {
    return !$this->_type->isMissing();
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier
   * | null | SimpleTypeSpecifier
   */
  public function getType(): ?ITypeSpecifier {
    if ($this->_type->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(ITypeSpecifier::class, $this->_type);
  }

  /**
   * @return ClosureTypeSpecifier | GenericTypeSpecifier | KeysetTypeSpecifier
   * | SimpleTypeSpecifier
   */
  public function getTypex(): ITypeSpecifier {
    return TypeAssert\not_null($this->getType());
  }
}
