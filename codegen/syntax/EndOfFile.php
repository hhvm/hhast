<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<2afe1f37e8629c2c0fa55e2d14fc579e>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class EndOfFile extends EditableSyntax {

  private EditableSyntax $_token;

  public function __construct(EditableSyntax $token) {
    parent::__construct('end_of_file');
    $this->_token = $token;
  }

  <<__Override>>
  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $token = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['end_of_file_token'],
      $position,
      $source,
    );
    $position += $token->width();
    return new self($token);
  }

  <<__Override>>
  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'token' => $this->_token;
  }

  <<__Override>>
  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $token = $this->_token->rewrite($rewriter, $parents);
    if (
      $token === $this->_token
    ) {
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
    return !$this->_token->is_missing();
  }

  public function getToken(): EndOfFileToken {
    return TypeAssert::isInstanceOf(EndOfFileToken::class, $this->_token);
  }
}
