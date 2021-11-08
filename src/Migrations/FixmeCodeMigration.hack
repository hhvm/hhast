/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use function Facebook\HHAST\{find_node_at_offset,offset_from_position};
use type Facebook\HHAST\__Private\TTypecheckerError;
use type Facebook\HHAST\{FixMe, NodeList, Script, WhiteSpace};
use namespace HH\Lib\{C, Dict, Keyset, Regex, Str, Vec};

/**
 * Migrates HH_FIXMEs and HH_IGNORE_ERRORs with the specified OLD_CODES to the
 * specified NEW_CODES, preserving the explanation inside the FIXME comment.
 * A single old FIXME may be replaced with multiple new FIXMEs or vice-versa.
 *
 * This doesn't remove the old FIXMEs. Once you are sure you no longer need
 * them, use `hh_client --remove-dead-fixmes` to clean them up.
 */
abstract class FixmeCodeMigration extends BaseMigration {
  use TypeErrorMigrationTrait;

  abstract const keyset<int> OLD_CODES;
  abstract const keyset<int> NEW_CODES;

  /**
   * We want to process typechecker errors with all of the NEW_CODES.
   */
  <<__Override>>
  final protected static function filterTypecheckerError(
    TTypecheckerError $error,
  ): bool {
    return C\contains_key(
      static::NEW_CODES,
      C\firstx($error['message'])['code'],
    );
  }

  /**
   * Parses the error code out of a FIXME comment.
   */
  private static function getFixMeCode(Trivia $trivia): ?int {
    if ($trivia is FixMe) {
      $match = Regex\first_match(
        $trivia->getText(),
        re"/\bHH_FIXME\[([0-9]+)\]/",
      );
    } else if ($trivia is IgnoreError) {
      $match = Regex\first_match(
        $trivia->getText(),
        re"/\bHH_IGNORE_ERROR\[([0-9]+)\]/",
      );
    } else {
      return null;
    }
    return $match is nonnull ? (int)$match[1] : null;
  }

  /**
   * Returns the new FIXME comment to be added to the file. This must only be
   * called with Trivia that is a valid FIXME comment.
   */
  private static function migrateFixMe(
    Trivia $trivia,
    int $new_code,
  ): Trivia {
    $old_code = self::getFixMeCode($trivia) as nonnull;
    $prefix = $trivia is FixMe ? 'HH_FIXME' : 'HH_IGNORE_ERROR';
    $text = Str\replace(
      $trivia->getText(),
      Str\format('%s[%d]', $prefix, $old_code),
      Str\format('%s[%d]', $prefix, $new_code),
    );
    return $trivia is FixMe ? new FixMe($text) : new IgnoreError($text);
  }

  <<__Override>>
  final public function migrateFile(string $path, Script $root): Script {
    $errors_by_offset = $this->getTypecheckerErrorsForFile($path)
      |> Vec\map($$, $error ==> C\firstx($error['message']))
      |> Dict\group_by(
        $$,
        $error ==> offset_from_position($root, $error['line'], $error['start']),
      );

    // These need to be stored before we do any replacements, otherwise the
    // offsets are no longer valid.
    $token_at_offset = Dict\from_keys(
      Keyset\keys($errors_by_offset),
      $offset ==> {
        $node = find_node_at_offset($root, $offset);
        if ($node is Trivia) {
          return null;
        }
        return $node->getFirstTokenx();
      },
    ) |> Dict\filter_nulls($$);

    foreach ($errors_by_offset as $offset => $errors) {
      $token = $token_at_offset[$offset] ?? null;
      if ($token is null) {
        continue;
      }

      // Avoid inserting the same FIXME multiple times (it could happen if there
      // are multiple errors on the same line).
      $existing_fixme_codes = keyset[];

      // Although a FIXME may be on the previous line or even further away, to
      // be valid, it must be part of the trivia of a token that is on the same
      // line as the token with the error. [citation needed]
      $same_line = true;

      // Go backwards until we find the exact token that has the old FIXME in
      // its leading trivia.
      do {
        $old_trivia = $token->getLeading()->getChildren();

        // Find the index of the old HH_FIXME. If there are multiple such
        // HH_FIXMEs, we take the last one.
        for ($idx = C\count($old_trivia) - 1; $idx >= 0; --$idx) {
          $code = self::getFixMeCode($old_trivia[$idx]);
          if ($code is nonnull) {
            if (C\contains_key(static::OLD_CODES, $code)) {
              break;
            } else if (C\contains_key(static::NEW_CODES, $code)) {
              $existing_fixme_codes[] = $code;
            }
          }
          if ($old_trivia[$idx] is EndOfLine) {
            $same_line = false;
          }
        }

        if ($idx !== -1) {
          // We found the HH_FIXME to migrate.
          break;
        } else if ($same_line) {
          $token = $root->getPreviousToken($token);
          if ($token is nonnull) {
            foreach ($token->getTrailing()->getChildren() as $trivia) {
              if ($trivia is EndOfLine) {
                $token = null;
                break;
              }
            }
          }
        } else {
          $token = null;
        }
      } while ($token is nonnull);

      if ($token is null) {
        // We didn't find a FIXME to migrate, so proceed to the next set of
        // errors (leaving unFIXME'd errors behind).
        continue;
      }

      $new_fixmes = vec[];
      foreach ($errors as $error) {
        if (!C\contains_key($existing_fixme_codes, $error['code'])) {
          $new_fixmes[] = self::migrateFixMe($old_trivia[$idx], $error['code']);
        }
      }
      if (C\is_empty($new_fixmes)) {
        continue;
      }

      // We duplicate the old FIXME along with any whitespace following it, so
      // as to not mess up indentation.
      $whitespace = vec[];
      for (++$idx; $idx < C\count($old_trivia); ++$idx) {
        if ($old_trivia[$idx] is WhiteSpace || $old_trivia[$idx] is EndOfLine) {
          $whitespace[] = $old_trivia[$idx];
        } else {
          break;
        }
      }

      $new_trivia = vec[];
      foreach ($new_fixmes as $fixme) {
        $new_trivia[] = $fixme;
        foreach ($whitespace as $w) {
          $new_trivia[] = $w;
        }
      }

      $new_leading = NodeList::createMaybeEmptyList(
        Vec\concat(
          // take the old trivia up to, and including the old FIXME and its
          // following whitespace
          Vec\slice($old_trivia, 0, $idx),
          // insert the new FIXME(s) and whitespace after the old
          $new_trivia,
          Vec\slice($old_trivia, $idx),
        ),
      );

      $root = $root->replace($token, $token->withLeading($new_leading));
    }

    return $root;
  }
}
