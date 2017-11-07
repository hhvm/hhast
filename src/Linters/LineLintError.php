<?hh // strict

namespace Facebook\HHAST\Linters;

class LineLintError extends LintError {

  public function __construct(
    private LineLinter $linter,
    private string $description,
    private (int, int) $position,
  ) {
    parent::__construct($linter, $description);
  }

  <<__Override>>
  public function getPosition(): (int, int) {
    return $this->position;
  }

  <<__Override>>
  public function getBlameCode(): ?string {

    $line = $this->position[0] - 1;
    invariant($line >= 0, 'line number should never be negative');
    return $this->linter->getLine($line);
  }

}
