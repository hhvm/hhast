/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use type Facebook\HHAST\File;
use namespace HH\Lib\C;

trait SuppressibleTrait {

  abstract protected function getErrorCode(): string;

  /**
   * A user can choose to ignore all errors reported by this linter for a
   * whole file using this string as a marker
   */
  public final function getIgnoreAllMarker(): string {
    return LintMarkerName::HHAST_IGNORE_ALL.
      '['.
      $this->getErrorCode().
      ']';
  }

  /**
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker
   */
  public final function getIgnoreSingleErrorMarker(): string {
    return LintMarkerName::HHAST_IGNORE_ERROR.
      '['.
      $this->getErrorCode().
      ']';
  }

  /**
   * A user can choose to ignore a specific error reported by this linter
   * using this string as a marker.
   *
   * The difference to HHAST_IGNORE_ERROR is that we expect this one to be
   * fixed.
   */
  public final function getFixmeMarker(): string {
    return
      LintMarkerName::HHAST_FIXME.'['.$this->getErrorCode().']';
  }

  /**
   * Is this error disabled for the entire file?
   */
  public final function isSuppressedForFile(File $file): bool {
    return C\contains_key(
      $file->errorCodesToSuppress()['whole_file'],
      $this->getErrorCode(),
    );
  }

  /** Check if this linter has been disabled by a comment on the previous line.
   */
  public final function isSuppressedForLine(File $file, int $previous_line_number): bool {
    $line_error_codes =
      $file->errorCodesToSuppress()['single_instance'];
    return (
      $line_error_codes[$previous_line_number][$this->getErrorCode()] ?? null
    ) is nonnull;
  }

}
