<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<8a4443d9965c8b63f03f03ac725f53d3>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class EndOfFile extends EditableSyntax {

  private EditableSyntax $_token;

  public function __construct(EditableSyntax $token) {
    parent::__construct('end_of_file');
    $this->_token = $token;
  }

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

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'token' => $this->_token;
  }

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

  public function token(): EndOfFileToken {
    return $this->tokenx();
  }

  public function tokenx(): EndOfFileToken {
    return TypeAssert::isInstanceOf(EndOfFileToken::class, $this->_token);
  }

  public function raw_token(): EditableSyntax {
    return $this->_token;
  }

  public function with_token(EditableSyntax $value): this {
    if ($value === $this->_token) {
      return $this;
    }
    return new self($value);
  }
}
