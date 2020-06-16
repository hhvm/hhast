/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<f367bb38593d8c89b34899e81b74c177>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;

<<__ConsistentConstruct>>
final class InclusionExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'inclusion_expression';

  private Token $_require;
  private IExpression $_filename;

  public function __construct(
    Token $require,
    IExpression $filename,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_require = $require;
    $this->_filename = $filename;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $require = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['inclusion_require'],
      $file,
      $offset,
      $source,
      'Token',
    );
    $require = $require as nonnull;
    $offset += $require->getWidth();
    $filename = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['inclusion_filename'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $filename = $filename as nonnull;
    $offset += $filename->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $require,
      /* HH_IGNORE_ERROR[4110] */ $filename,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'require' => $this->_require,
      'filename' => $this->_filename,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $require = $rewriter($this->_require, $parents);
    $filename = $rewriter($this->_filename, $parents);
    if ($require === $this->_require && $filename === $this->_filename) {
      return $this;
    }
    return new static(
      /* HH_FIXME[4110] use `as` */ $require,
      /* HH_FIXME[4110] use `as` */ $filename,
    );
  }

  public function getRequireUNTYPED(): ?Node {
    return $this->_require;
  }

  public function withRequire(Token $value): this {
    if ($value === $this->_require) {
      return $this;
    }
    return new static($value, $this->_filename);
  }

  public function hasRequire(): bool {
    return $this->_require !== null;
  }

  /**
   * @return IncludeToken | Include_onceToken | RequireToken | Require_onceToken
   */
  public function getRequire(): Token {
    return TypeAssert\instance_of(Token::class, $this->_require);
  }

  /**
   * @return IncludeToken | Include_onceToken | RequireToken | Require_onceToken
   */
  public function getRequirex(): Token {
    return $this->getRequire();
  }

  public function getFilenameUNTYPED(): ?Node {
    return $this->_filename;
  }

  public function withFilename(IExpression $value): this {
    if ($value === $this->_filename) {
      return $this;
    }
    return new static($this->_require, $value);
  }

  public function hasFilename(): bool {
    return $this->_filename !== null;
  }

  /**
   * @return BinaryExpression | LiteralExpression | ParenthesizedExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getFilename(): IExpression {
    return TypeAssert\instance_of(IExpression::class, $this->_filename);
  }

  /**
   * @return BinaryExpression | LiteralExpression | ParenthesizedExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getFilenamex(): IExpression {
    return $this->getFilename();
  }
}
