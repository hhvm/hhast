<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<66b4e698fb77439426d7144850d3530d>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

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
    return new self($require, $filename);
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
    return new self($require, $filename);
  }

  public function getRequireUNTYPED(): EditableNode {
    return $this->_require;
  }

  public function withRequire(EditableNode $value): this {
    if ($value === $this->_require) {
      return $this;
    }
    return new self($value, $this->_filename);
  }

  public function hasRequire(): bool {
    return !$this->_require->isMissing();
  }

  /**
   * @returns IncludeToken | RequireToken | Include_onceToken |
   * Require_onceToken
   */
  public function getRequire(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_require);
  }

  public function getFilenameUNTYPED(): EditableNode {
    return $this->_filename;
  }

  public function withFilename(EditableNode $value): this {
    if ($value === $this->_filename) {
      return $this;
    }
    return new self($this->_require, $value);
  }

  public function hasFilename(): bool {
    return !$this->_filename->isMissing();
  }

  /**
   * @returns BinaryExpression | LiteralExpression | VariableExpression |
   * NameToken | ParenthesizedExpression | SubscriptExpression
   */
  public function getFilename(): EditableNode {
    return TypeAssert\instance_of(EditableNode::class, $this->_filename);
  }
}
