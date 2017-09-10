<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<a4e32ce996be214d68521352592adb85>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

final class GlobalStatement extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_variables;
  private EditableSyntax $_semicolon;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $variables,
    EditableSyntax $semicolon,
  ) {
    parent::__construct('global_statement');
    $this->_keyword = $keyword;
    $this->_variables = $variables;
    $this->_semicolon = $semicolon;
  }

  public static function from_json(
    array<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['global_keyword'],
      $position,
      $source,
    );
    $position += $keyword->width();
    $variables = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['global_variables'],
      $position,
      $source,
    );
    $position += $variables->width();
    $semicolon = EditableSyntax::from_json(
      /* UNSAFE_EXPR */ $json['global_semicolon'],
      $position,
      $source,
    );
    $position += $semicolon->width();
    return new self($keyword, $variables, $semicolon);
  }

  public function children(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'variables' => $this->_variables;
    yield 'semicolon' => $this->_semicolon;
  }

  public function rewrite_children(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $variables = $this->_variables->rewrite($rewriter, $parents);
    $semicolon = $this->_semicolon->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $variables === $this->_variables &&
      $semicolon === $this->_semicolon
    ) {
      return $this;
    }
    return new self($keyword, $variables, $semicolon);
  }

  public function keyword(): GlobalToken {
    return $this->keywordx();
  }

  public function keywordx(): GlobalToken {
    return TypeAssert::isInstanceOf(GlobalToken::class, $this->_keyword);
  }

  public function raw_keyword(): EditableSyntax {
    return $this->_keyword;
  }

  public function with_keyword(EditableSyntax $value): this {
    return new self($value, $this->_variables, $this->_semicolon);
  }

  public function variables(): EditableList {
    return $this->variablesx();
  }

  public function variablesx(): EditableList {
    return TypeAssert::isInstanceOf(EditableList::class, $this->_variables);
  }

  public function raw_variables(): EditableSyntax {
    return $this->_variables;
  }

  public function with_variables(EditableSyntax $value): this {
    return new self($this->_keyword, $value, $this->_semicolon);
  }

  public function semicolon(): SemicolonToken {
    return $this->semicolonx();
  }

  public function semicolonx(): SemicolonToken {
    return TypeAssert::isInstanceOf(SemicolonToken::class, $this->_semicolon);
  }

  public function raw_semicolon(): EditableSyntax {
    return $this->_semicolon;
  }

  public function with_semicolon(EditableSyntax $value): this {
    return new self($this->_keyword, $this->_variables, $value);
  }
}
