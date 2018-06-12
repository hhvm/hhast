<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<4f5556b44e4f860ef90aaca8b92bd5e2>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

<<__ConsistentConstruct>>
final class InclusionExpression extends EditableNode {

  private EditableNode $_require;
  private EditableNode $_filename;

  public function __construct(EditableNode $require, EditableNode $filename) {
    parent::__construct('inclusion_expression');
    $this->_require = $require;
    $this->_filename = $filename;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
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
    $offset += $filename->getWidth();
    return new static($require, $filename);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'require' => $this->_require,
      'filename' => $this->_filename,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $require = $this->_require->rewrite($rewriter, $parents);
    $filename = $this->_filename->rewrite($rewriter, $parents);
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
   * @returns IncludeToken | Include_onceToken | RequireToken |
   * Require_onceToken
   */
  public function getRequire(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_require);
  }

  /**
   * @returns IncludeToken | Include_onceToken | RequireToken |
   * Require_onceToken
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
   * @returns BinaryExpression | LiteralExpression | ParenthesizedExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getFilename(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_filename);
  }

  /**
   * @returns BinaryExpression | LiteralExpression | ParenthesizedExpression |
   * SubscriptExpression | NameToken | VariableExpression
   */
  public function getFilenamex(): EditableNode {
    return $this->getFilename();
  }
}
