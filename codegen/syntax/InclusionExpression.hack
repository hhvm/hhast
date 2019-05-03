/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<58d8f3136d5be860e56c80abdb66176d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class InclusionExpression extends EditableNode implements IExpression {

  private EditableNode $_require;
  private EditableNode $_filename;

  public function __construct(
    EditableNode $require,
    EditableNode $filename,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_require = $require;
    $this->_filename = $filename;
    parent::__construct('inclusion_expression', $source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
  ): this {
    $offset = $initial_offset;
    $require = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['inclusion_require'],
      $file,
      $offset,
      $source,
    );
    $offset += $require->getWidth();
    $filename = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['inclusion_filename'],
      $file,
      $offset,
      $source,
    );
    $filename = $filename->isMissing()
      ? $filename
      : __Private\Wrap\wrap_IExpression($filename);
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
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'require' => $this->_require,
      'filename' => $this->_filename,
    ];
  }

  <<__Override>>
  public function rewriteChildren(
    self::TRewriter $rewriter,
    vec<EditableNode> $parents = vec[],
  ): this {
    $parents[] = $this;
    $require = $rewriter($this->_require, $parents);
    $filename = $rewriter($this->_filename, $parents);
    if ($require === $this->_require && $filename === $this->_filename) {
      return $this;
    }
    return new static($require, $filename);
  }

  public function getRequireUNTYPED(): EditableNode {
    return $this->_require;
  }

  public function withRequire(EditableNode $value): this {
    if ($value === $this->_require) {
      return $this;
    }
    return new static($value, $this->_filename);
  }

  public function hasRequire(): bool {
    return !$this->_require->isMissing();
  }

  /**
   * @return IncludeToken | Include_onceToken | RequireToken | Require_onceToken
   */
  public function getRequire(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_require);
  }

  /**
   * @return IncludeToken | Include_onceToken | RequireToken | Require_onceToken
   */
  public function getRequirex(): EditableToken {
    return $this->getRequire();
  }

  public function getFilenameUNTYPED(): EditableNode {
    return $this->_filename;
  }

  public function withFilename(EditableNode $value): this {
    if ($value === $this->_filename) {
      return $this;
    }
    return new static($this->_require, $value);
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
