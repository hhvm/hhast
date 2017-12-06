<?hh // strict
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<85290d39fca52f3a04c7b4321adc47c4>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class EndOfFile extends EditableNode {

  private EditableNode $_token;

  public function __construct(EditableNode $token) {
    parent::__construct('end_of_file');
    $this->_token = $token;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    string $file,
    int $offset,
    string $source,
  ): this {
    $token = EditableNode::fromJSON(
      /* UNSAFE_EXPR */ $json['end_of_file_token'],
      $file,
      $offset,
      $source,
    );
    $offset += $token->getWidth();
    return new self($token);
  }

  <<__Override>>
  public function getChildren(): dict<string, EditableNode> {
    return dict[
      'token' => $this->_token,
    ];
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?vec<EditableNode> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $token = $this->_token->rewrite($rewriter, $parents);
    if ($token === $this->_token) {
      return $this;
    }
    return new self($token);
  }

  public function getTokenUNTYPED(): EditableNode {
    return $this->_token;
  }

  public function withToken(EditableNode $value): this {
    if ($value === $this->_token) {
      return $this;
    }
    return new self($value);
  }

  public function hasToken(): bool {
    return !$this->_token->isMissing();
  }

  /**
   * @returns EndOfFileToken
   */
  public function getToken(): EndOfFileToken {
    return TypeAssert\instance_of(EndOfFileToken::class, $this->_token);
  }
}
