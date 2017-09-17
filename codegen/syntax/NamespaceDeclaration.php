<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<868946e0272c5d24f2ae6993aeda6f0e>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;

final class NamespaceDeclaration extends EditableSyntax {

  private EditableSyntax $_keyword;
  private EditableSyntax $_name;
  private EditableSyntax $_body;

  public function __construct(
    EditableSyntax $keyword,
    EditableSyntax $name,
    EditableSyntax $body,
  ) {
    parent::__construct('namespace_declaration');
    $this->_keyword = $keyword;
    $this->_name = $name;
    $this->_body = $body;
  }

  <<__Override>>
  public static function fromJSON(
    dict<string, mixed> $json,
    int $position,
    string $source,
  ): this {
    $keyword = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_keyword'],
      $position,
      $source,
    );
    $position += $keyword->getWidth();
    $name = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_name'],
      $position,
      $source,
    );
    $position += $name->getWidth();
    $body = EditableSyntax::fromJSON(
      /* UNSAFE_EXPR */ $json['namespace_body'],
      $position,
      $source,
    );
    $position += $body->getWidth();
    return new self($keyword, $name, $body);
  }

  <<__Override>>
  public function getChildren(): KeyedTraversable<string, EditableSyntax> {
    yield 'keyword' => $this->_keyword;
    yield 'name' => $this->_name;
    yield 'body' => $this->_body;
  }

  <<__Override>>
  public function rewriteDescendants(
    self::TRewriter $rewriter,
    ?Traversable<EditableSyntax> $parents = null,
  ): this {
    $parents = $parents === null ? vec[] : vec($parents);
    $parents[] = $this;
    $keyword = $this->_keyword->rewrite($rewriter, $parents);
    $name = $this->_name->rewrite($rewriter, $parents);
    $body = $this->_body->rewrite($rewriter, $parents);
    if (
      $keyword === $this->_keyword &&
      $name === $this->_name &&
      $body === $this->_body
    ) {
      return $this;
    }
    return new self($keyword, $name, $body);
  }

  public function getKeywordUNTYPED(): EditableSyntax {
    return $this->_keyword;
  }

  public function withKeyword(EditableSyntax $value): this {
    if ($value === $this->_keyword) {
      return $this;
    }
    return new self($value, $this->_name, $this->_body);
  }

  public function hasKeyword(): bool {
    return !$this->_keyword->isMissing();
  }

  /**
   * @returns NamespaceToken
   */
  public function getKeyword(): NamespaceToken {
    return TypeAssert\instance_of(NamespaceToken::class, $this->_keyword);
  }

  public function getNameUNTYPED(): EditableSyntax {
    return $this->_name;
  }

  public function withName(EditableSyntax $value): this {
    if ($value === $this->_name) {
      return $this;
    }
    return new self($this->_keyword, $value, $this->_body);
  }

  public function hasName(): bool {
    return !$this->_name->isMissing();
  }

  /**
   * @returns NameToken | QualifiedNameToken | Missing | DictToken |
   * KeysetToken | VecToken
   */
  public function getName(): ?EditableToken {
    if ($this->_name->isMissing()) {
      return null;
    }
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  /**
   * @returns NameToken | QualifiedNameToken | DictToken | KeysetToken |
   * VecToken
   */
  public function getNamex(): EditableToken {
    return TypeAssert\instance_of(EditableToken::class, $this->_name);
  }

  public function getBodyUNTYPED(): EditableSyntax {
    return $this->_body;
  }

  public function withBody(EditableSyntax $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new self($this->_keyword, $this->_name, $value);
  }

  public function hasBody(): bool {
    return !$this->_body->isMissing();
  }

  /**
   * @returns NamespaceBody | NamespaceEmptyBody
   */
  public function getBody(): EditableSyntax {
    return TypeAssert\instance_of(EditableSyntax::class, $this->_body);
  }
}
