<?hh // strict

namespace Facebook\HHAST\Linters;

class FixableLineLintError extends LineLintError implements FixableLintError {

  public function __construct(
    private AutoFixingLineLinter<FixableLineLintError> $linter,
    private string $description,
    private (int, int) $position,
  ) {
    parent::__construct($linter, $description, $position);
  }

  public function isFixable(): bool {
    return true;
  }

  public function getReadableFix(): (string, string) {

    $original = $this->getBlameCode();
    invariant($original !== null, 'blame line should never be null');
    $fixed = $this->linter->getFixedLine($original);
    return tuple($original, $fixed);
  }

  public function shouldRenderBlameAndFixAsDiff(): bool {
    return true;
  }

}
