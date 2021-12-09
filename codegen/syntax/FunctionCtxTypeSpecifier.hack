/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<5f60bd9e49ef0ec0309ccf51a474b35a>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class FunctionCtxTypeSpecifier extends Node implements ITypeSpecifier {

  const string SYNTAX_KIND = 'function_ctx_type_specifier';

  private CtxToken $_keyword;
  private VariableToken $_variable;

  public function __construct(
    CtxToken $keyword,
    VariableToken $variable,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_keyword = $keyword;
    $this->_variable = $variable;
    parent::__construct($source_ref);
  }

  <<__Override>>
  public static function fromJSON(
    dict<arraykey, mixed> $json,
    string $file,
    int $initial_offset,
    string $source,
    string $_type_hint,
  ): this {
    $offset = $initial_offset;
    $keyword = Node::fromJSON(
      ($json['function_ctx_type_keyword']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'CtxToken',
    );
    $keyword = $keyword as nonnull;
    $offset += $keyword->getWidth();
    $variable = Node::fromJSON(
      ($json['function_ctx_type_variable']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'VariableToken',
    );
    $variable = $variable as nonnull;
    $offset += $variable->getWidth();
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      /* HH_IGNORE_ERROR[4110] */ $keyword,
      /* HH_IGNORE_ERROR[4110] */ $variable,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'keyword' => $this->_keyword,
      'variable' => $this->_variable,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $keyword = $rewriter($this->_keyword, $parents);
    $variable = $rewriter($this->_variable, $parents);
    if ($keyword === $this->_keyword && $variable === $this->_variable) {
      return $this;
    }
    return new static($keyword as CtxToken, $variable as VariableToken);
  }

  public function getKeywordUNTYPED(): ?Node {
    return $this->_keyword;
  }

  public function withKeyword(CtxToken $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new static($value, $this->_variable);
  }

  public function hasKeyword(): bool {
    return true;
  }

  /**
   * @return CtxToken
   */
  public function getKeyword(): CtxToken {
    return TypeAssert\instance_of(CtxToken::class, $this->_keyword);
  }

  /**
   * @return CtxToken
   */
  public function getKeywordx(): CtxToken {
    return $this->getKeyword();
  }

  public function getVariableUNTYPED(): ?Node {
    return $this->_variable;
  }

  public function withVariable(VariableToken $value): this {
    if ($value === $this->_variable) {
      return $this;
    }
    return new static($this->_keyword, $value);
  }

  public function hasVariable(): bool {
    return true;
  }

  /**
   * @return VariableToken
   */
  public function getVariable(): VariableToken {
    return TypeAssert\instance_of(VariableToken::class, $this->_variable);
  }

  /**
   * @return VariableToken
   */
  public function getVariablex(): VariableToken {
    return $this->getVariable();
  }
}
