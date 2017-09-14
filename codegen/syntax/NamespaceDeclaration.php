<?hh
/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<dbd1f450f9e25ddbf1dbeec88148c5bc>>
 */
namespace Facebook\HHAST;
use type Facebook\TypeAssert\TypeAssert;

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
    return TypeAssert::isInstanceOf(NamespaceToken::class, $this->_keyword);
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
   * @returns NameToken | QualifiedNameToken | DictToken | KeysetToken |
   * VecToken
   */
  public function getName(): EditableToken {
    return TypeAssert::isInstanceOf(EditableToken::class, $this->_name);
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
    return TypeAssert::isInstanceOf(EditableSyntax::class, $this->_body);
  }
}
