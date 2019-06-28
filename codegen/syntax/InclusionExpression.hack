/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<20e69e96395aab28c44dd5ea426e029a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class InclusionExpression
  extends Node
  implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'inclusion_expression';

  private Node $_require;
  private Node $_filename;

  public function __construct(
    Node $require,
    Node $filename,
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
    $offset += $require->getWidth();
    $filename = Node::fromJSON(
      /* HH_FIXME[4110] */ $json['inclusion_filename'],
      $file,
      $offset,
      $source,
      'IExpression',
    );
    $offset += $filename->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static($require, $filename, $source_ref);
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'require' => $this->_require,
      'filename' => $this->_filename,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $require = $rewriter($this->_require, $parents);
    $filename = $rewriter($this->_filename, $parents);
    if ($require === $this->_require && $filename === $this->_filename) {
      return $this;
    }
    return new static($require, $filename);
  }

  public function getRequireUNTYPED(): Node {
    return $this->_require;
  }

  public function withRequire(Token $value): this {
    if ($value === $this->_require) {
      return $this;
    }
    return new static($value ?? Missing(), $this->_filename);
  }

  public function hasRequire(): bool {
    return !$this->_require->isMissing();
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

  public function getFilenameUNTYPED(): Node {
    return $this->_filename;
  }

  public function withFilename(IExpression $value): this {
    if ($value === $this->_filename) {
      return $this;
    }
    return new static($this->_require, $value ?? Missing());
  }

  public function hasFilename(): bool {
    return !$this->_filename->isMissing();
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
