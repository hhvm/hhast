<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b955908290cc69725712f03a2a1adf59>>
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

  public function rewrite(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): EditableSyntax {
    $parents = $parents === null ? vec[] : vec($parents);
    $child_parents = $parents;
    $child_parents[] = $this;
    $token = $this->_token->rewrite($rewriter, $child_parents);
    if ($token === $this->_token) {
      $node = $this;
    } else {
      $node = new self($token);
    }
    return $rewriter($node, $parents);
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
    return new self($value);
  }
}
