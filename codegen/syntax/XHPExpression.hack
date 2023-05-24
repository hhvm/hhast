/**
 * This file is generated. Do not modify it manually!
 *
 * @generated SignedSource<<b2a60abae723717fdf59d6f10352f017>>
 */
namespace Facebook\HHAST;
use namespace Facebook\TypeAssert;
use namespace HH\Lib\Dict;
/* HHAST_IGNORE_ALL[5607] 5607 is ignored because of false positives when comparing a generic to a typed value */
/* HHAST_IGNORE_ALL[5624] HHAST_IGNORE_ALL[5639] 5624 and 5639 are ignored because they insist on using co(tra)variant generics. Could this break external consumers? */

<<__ConsistentConstruct>>
final class XHPExpression extends Node implements ILambdaBody, IExpression {

  const string SYNTAX_KIND = 'xhp_expression';

  private XHPOpen $_open;
  private ?NodeList<Node> $_body;
  private ?XHPClose $_close;

  public function __construct(
    XHPOpen $open,
    ?NodeList<Node> $body,
    ?XHPClose $close,
    ?__Private\SourceRef $source_ref = null,
  ) {
    $this->_open = $open;
    $this->_body = $body;
    $this->_close = $close;
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
    $open = Node::fromJSON(
      ($json['xhp_open']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'XHPOpen',
    );
    $open = $open as nonnull;
    $offset += $open->getWidth();
    $body = Node::fromJSON(
      ($json['xhp_body'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'NodeList<Node>',
    );
    $offset += $body?->getWidth() ?? 0;
    $close = Node::fromJSON(
      ($json['xhp_close'] ?? dict['kind' => 'missing']) as dict<_, _>,
      $file,
      $offset,
      $source,
      'XHPClose',
    );
    $offset += $close?->getWidth() ?? 0;
    $source_ref = shape(
      'file' => $file,
      'source' => $source,
      'offset' => $initial_offset,
      'width' => $offset - $initial_offset,
    );
    return new static(
      $open as XHPOpen,
      $body as ?NodeList<_>,
      $close as ?XHPClose,
      $source_ref,
    );
  }

  <<__Override>>
  public function getChildren(): dict<string, Node> {
    return dict[
      'open' => $this->_open,
      'body' => $this->_body,
      'close' => $this->_close,
    ]
      |> Dict\filter_nulls($$);
  }

  <<__Override>>
  public function rewriteChildren<Tret as ?Node>(
    (function(Node, vec<Node>): Tret) $rewriter,
    vec<Node> $parents = vec[],
  ): this {
    $parents[] = $this;
    $open = $rewriter($this->_open, $parents);
    $body = $this->_body === null ? null : $rewriter($this->_body, $parents);
    $close = $this->_close === null ? null : $rewriter($this->_close, $parents);
    if (
      $open === $this->_open &&
      $body === $this->_body &&
      $close === $this->_close
    ) {
      return $this;
    }
    return
      new static($open as XHPOpen, $body as ?NodeList<_>, $close as ?XHPClose);
  }

  public function getOpenUNTYPED(): ?Node {
    return $this->_open;
  }

  public function withOpen(XHPOpen $value): this {
    if ($value === $this->_open) {
      return $this;
    }
    return new static($value, $this->_body, $this->_close);
  }

  public function hasOpen(): bool {
    return true;
  }

  /**
   * @return XHPOpen
   */
  public function getOpen(): XHPOpen {
    return TypeAssert\instance_of(XHPOpen::class, $this->_open);
  }

  /**
   * @return XHPOpen
   */
  public function getOpenx(): XHPOpen {
    return $this->getOpen();
  }

  public function getBodyUNTYPED(): ?Node {
    return $this->_body;
  }

  public function withBody(?NodeList<Node> $value): this {
    if ($value === $this->_body) {
      return $this;
    }
    return new static($this->_open, $value, $this->_close);
  }

  public function hasBody(): bool {
    return $this->_body !== null;
  }

  /**
   * @return NodeList<BracedExpression> | NodeList<Node> |
   * NodeList<XHPBodyToken> | NodeList<XHPCommentToken> |
   * NodeList<XHPExpression> | null
   */
  public function getBody(): ?NodeList<Node> {
    return $this->_body;
  }

  /**
   * @return NodeList<BracedExpression> | NodeList<Node> |
   * NodeList<XHPBodyToken> | NodeList<XHPCommentToken> |
   * NodeList<XHPExpression>
   */
  public function getBodyx(): NodeList<Node> {
    return TypeAssert\not_null($this->getBody());
  }

  public function getCloseUNTYPED(): ?Node {
    return $this->_close;
  }

  public function withClose(?XHPClose $value): this {
    if ($value === $this->_close) {
      return $this;
    }
    return new static($this->_open, $this->_body, $value);
  }

  public function hasClose(): bool {
    return $this->_close !== null;
  }

  /**
   * @return null | XHPClose
   */
  public function getClose(): ?XHPClose {
    return $this->_close;
  }

  /**
   * @return XHPClose
   */
  public function getClosex(): XHPClose {
    return TypeAssert\not_null($this->getClose());
  }
}
