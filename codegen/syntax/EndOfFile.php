<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<eb5c2d53d6fafffa07fa2d608c256e79>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class EndOfFile extends EditableSyntax {

  private EditableSyntax $_token;

  public function __construct(EditableSyntax $token) {
    parent::__construct('end_of_file');
    $this->_token = $token;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $token = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['end_of_file_token'],
      $position,
      $source,
    );
    $position += $token->getWidth();
    return new self($token);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'token' => $this->_token;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $token = $this->_token->rewrite($rewriter, $parents);
    if ($token === $this->_token) {
      return $this;
    }
    return new self($token);
  }

  public function getTokenUNTYPED(): EditableSyntax {
    return $this->_token;
  }

  public function withToken(EditableSyntax $value): this {
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
