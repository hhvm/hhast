/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\{C, Vec};

/**
 * Migrates builtin functions that originally accepted one or more parameters by
 * reference to the equivalent functions with inout parameters. For example,
 * preg_match() and preg_match_all() to preg_match_with_matches() and
 * preg_match_all_with_matches().
 */
final class RefToInoutMigration extends BaseMigration {

  const type TNodes = shape(
    'root' => Script,
    'call' => FunctionCallExpression,
    'name' => Node,
    'args' => vec<IExpression>,
  );

  const DUMMY_VARIABLE_NAME = '__unused_inout';

  <<__Memoize>>
  private static function getRules(
  ): dict<string, (function(this::TNodes): Script)> {
    return dict[
      // straightforward refToInout
      'array_pop' => $n ==> self::refToInout($n, 0),
      'array_push' => $n ==> self::refToInout($n, 0),
      'array_shift' => $n ==> self::refToInout($n, 0),
      'array_splice' => $n ==> self::refToInout($n, 0),
      'array_unshift' => $n ==> self::refToInout($n, 0),
      'arsort' => $n ==> self::refToInout($n, 0),
      'asort' => $n ==> self::refToInout($n, 0),
      'clock_getres' => $n ==> self::refToInout($n, 1, 2),
      'clock_gettime' => $n ==> self::refToInout($n, 1, 2),
      'collator_asort' => $n ==> self::refToInout($n, 1),
      'collator_sort' => $n ==> self::refToInout($n, 1),
      'collator_sort_with_sort_keys' => $n ==> self::refToInout($n, 1),
      'curl_multi_exec' => $n ==> self::refToInout($n, 1),
      'datefmt_localtime' => $n ==> self::refToInout($n, 2),
      'each' => $n ==> self::refToInout($n, 0),
      'end' => $n ==> self::refToInout($n, 0),
      'fb_unserialize' => $n ==> self::refToInout($n, 1),
      'fb_utf8ize' => $n ==> self::refToInout($n, 0),
      'gmp_clrbit' => $n ==> self::refToInout($n, 0),
      'gmp_setbit' => $n ==> self::refToInout($n, 0),
      'intltz_get_offset' => $n ==> self::refToInout($n, 3, 4),
      'krsort' => $n ==> self::refToInout($n, 0),
      'ksort' => $n ==> self::refToInout($n, 0),
      'ldap_get_option' => $n ==> self::refToInout($n, 2),
      'ldap_parse_reference' => $n ==> self::refToInout($n, 2),
      'mb_convert_variables' => $n ==> self::refToInout($n, 2),
      'natcasesort' => $n ==> self::refToInout($n, 0),
      'natsort' => $n ==> self::refToInout($n, 0),
      'next' => $n ==> self::refToInout($n, 0),
      'openssl_csr_export' => $n ==> self::refToInout($n, 1),
      'openssl_csr_new' => $n ==> self::refToInout($n, 1),
      'openssl_open' => $n ==> self::refToInout($n, 1),
      'openssl_pkcs12_export' => $n ==> self::refToInout($n, 1),
      'openssl_pkcs12_read' => $n ==> self::refToInout($n, 1),
      'openssl_pkey_export' => $n ==> self::refToInout($n, 1),
      'openssl_private_decrypt' => $n ==> self::refToInout($n, 1),
      'openssl_private_encrypt' => $n ==> self::refToInout($n, 1),
      'openssl_public_decrypt' => $n ==> self::refToInout($n, 1),
      'openssl_public_encrypt' => $n ==> self::refToInout($n, 1),
      'openssl_sign' => $n ==> self::refToInout($n, 1),
      'openssl_x509_export' => $n ==> self::refToInout($n, 1),
      'pagelet_server_task_result' => $n ==> self::refToInout($n, 1, 2),
      'parse_str' => $n ==> self::refToInout($n, 1),
      'pcntl_wait' => $n ==> self::refToInout($n, 0),
      'pcntl_waitpid' => $n ==> self::refToInout($n, 1),
      'prev' => $n ==> self::refToInout($n, 0),
      'proc_open' => $n ==> self::refToInout($n, 2),
      'reset' => $n ==> self::refToInout($n, 0),
      'rsort' => $n ==> self::refToInout($n, 0),
      'shuffle' => $n ==> self::refToInout($n, 0),
      'socket_create_pair' => $n ==> self::refToInout($n, 3),
      'socket_recv' => $n ==> self::refToInout($n, 1),
      'socket_select' => $n ==> self::refToInout($n, 0, 1, 2),
      'sodium_add' => $n ==> self::refToInout($n, 0),
      'sodium_crypto_generichash_final' => $n ==> self::refToInout($n, 0),
      'sodium_crypto_generichash_update' => $n ==> self::refToInout($n, 0),
      'sodium_increment' => $n ==> self::refToInout($n, 0),
      'sodium_memzero' => $n ==> self::refToInout($n, 0),
      'sort' => $n ==> self::refToInout($n, 0),
      'stream_select' => $n ==> self::refToInout($n, 0, 1, 2),
      'uasort' => $n ==> self::refToInout($n, 0),
      'uksort' => $n ==> self::refToInout($n, 0),
      'usort' => $n ==> self::refToInout($n, 0),
      'xbox_send_message' => $n ==> self::refToInout($n, 1),
      'xbox_task_result' => $n ==> self::refToInout($n, 2),

      // variant with inout argument has a new name
      'current' => $n ==>
        self::renameIfHasRefOrInout($n, 'current_ref', 0),
      'icu_match' => $n ==>
        self::renameIfHasRefOrInout($n, 'icu_match_with_matches', 2),
      'is_callable' => $n ==>
        self::renameIfHasRefOrInout($n, 'is_callable_with_name', 2),
      'key' => $n ==>
        self::renameIfHasRefOrInout($n, 'key_ref', 0),
      'openssl_encrypt' => $n ==>
        self::renameIfHasRefOrInout($n, 'openssl_encrypt_with_tag', 5),
      'pos' => $n ==>
        self::renameIfHasRefOrInout($n, 'current_ref', 0),
      'preg_match' => $n ==>
        self::renameIfHasRefOrInout($n, 'preg_match_with_matches', 2),
      'preg_match_all' => $n ==>
        self::renameIfHasRefOrInout($n, 'preg_match_all_with_matches', 2),
      'preg_replace' => $n ==>
        self::renameIfHasRefOrInout($n, 'preg_replace_with_count', 4),
      'str_ireplace' => $n ==>
        self::renameIfHasRefOrInout($n, 'str_ireplace_with_count', 3),
      'str_replace' => $n ==>
        self::renameIfHasRefOrInout($n, 'str_replace_with_count', 3),
      'xml_set_object' => $n ==>
        self::renameIfHasRefOrInout($n, 'xml_set_object_ref', 1),

      // optional by-ref params became required inout params
      'apc_dec' => $n ==>
        self::optionalToRequired($n, 2, 1, vec['1']),
      'apc_fetch' => $n ==>
        self::optionalToRequired($n, 1),
      'apc_inc' => $n ==>
        self::optionalToRequired($n, 2, 1, vec['1']),
      'curl_multi_info_read' => $n ==>
        self::optionalToRequired($n, 1),
      'datefmt_parse' => $n ==>
        self::optionalToRequired($n, 2),
      'dns_get_record' => $n ==>
        self::optionalToRequired($n, 2, 2, vec['\\DNS_ANY']),
      'exec' => $n ==>
        self::optionalToRequired($n, 1, 2),
      'exif_thumbnail' => $n ==>
        self::optionalToRequired($n, 1, 3),
      'fb_compact_unserialize' => $n ==>
        self::optionalToRequired($n, 1, 2),
      'fb_curl_multi_fdset' => $n ==>
        self::optionalToRequired($n, 1, 4),
      'flock' => $n ==>
        self::optionalToRequired($n, 2),
      'fsockopen' => $n ==>
        self::optionalToRequired($n, 2, 2, vec['-1']),
      'getimagesize' => $n ==>
        self::optionalToRequired($n, 1),
      'getimagesizefromstring' => $n ==>
        self::optionalToRequired($n, 1),
      'getmxrr' => $n ==>
        self::optionalToRequired($n, 1, 2),
      'grapheme_extract' => $n ==>
        self::optionalToRequired($n, 4, 1, vec['\\GRAPHEME_EXTR_COUNT', '0']),
      'intltz_get_canonical_id' => $n ==>
        self::optionalToRequired($n, 1),
      'ldap_control_paged_result_response' => $n ==>
        self::optionalToRequired($n, 2, 2),
      'ldap_parse_result' => $n ==>
        self::optionalToRequired($n, 2, 4),
      'mb_ereg' => $n ==>
        self::optionalToRequired($n, 2),
      'mb_eregi' => $n ==>
        self::optionalToRequired($n, 2),
      'mb_parse_str' => $n ==>
        self::optionalToRequired($n, 1),
      'msg_send' => $n ==>
        self::optionalToRequired($n, 5, 1, vec['true', 'true']),
      'numfmt_parse' => $n ==>
        self::optionalToRequired($n, 3),
      'numfmt_parse_currency' => $n ==>
        self::optionalToRequired($n, 2, 2),
      'openssl_random_pseudo_bytes' => $n ==>
        self::optionalToRequired($n, 1),
      'passthru' => $n ==>
        self::optionalToRequired($n, 1),
      'pcntl_sigprocmask' => $n ==>
        self::optionalToRequired($n, 2),
      'pfsockopen' => $n ==>
        self::optionalToRequired($n, 2, 2, vec['-1']),
      'preg_filter' => $n ==>
        self::optionalToRequired($n, 4, 1, vec['-1']),
      'preg_replace_callback' => $n ==>
        self::optionalToRequired($n, 4, 1, vec['-1']),
      'preg_replace_callback_array' => $n ==>
        self::optionalToRequired($n, 3, 1, vec['-1']),
      'similar_text' => $n ==>
        self::optionalToRequired($n, 2),
      'socket_getpeername' => $n ==>
        self::optionalToRequired($n, 1, 2),
      'socket_getsockname' => $n ==>
        self::optionalToRequired($n, 1, 2),
      'socket_server' => $n ==>
        self::optionalToRequired($n, 2, 2, vec['-1']),
      'stream_socket_accept' => $n ==>
        self::optionalToRequired($n, 2, 1, vec["\\ini_get('default_socket_timeout')"]),
      'stream_socket_client' => $n ==>
        self::optionalToRequired($n, 1, 2),
      'stream_socket_recvfrom' => $n ==>
        self::optionalToRequired($n, 3, 1, vec['0']),
      'stream_socket_server' => $n ==>
        self::optionalToRequired($n, 1, 2),
      'system' => $n ==>
        self::optionalToRequired($n, 1),
      'xml_parse_into_struct' => $n ==>
        self::optionalToRequired($n, 2, 2),
    ];
  }

  /**
   * Change the name of the called function, but only if the specified argument
   * is by-ref or inout (not by-value). If the argument is by-ref, also change
   * it to inout.
   *
   * Ex: preg_match('/([a-z])/', $str, &$matches)
   * To: preg_match_with_matches('/([a-z])/', $str, inout $matches)
   */
  private static function renameIfHasRefOrInout(
    this::TNodes $n,
    string $new_name,
    int $arg_idx,
  ): Script {
    $arg = $n['args'][$arg_idx] ?? null;
    if ($arg is null || !self::isRefOrInout($arg)) {
      return $n['root'];
    }

    $leading = $n['name']->getFirstTokenx()->getLeading();
    $trailing = $n['name']->getLastTokenx()->getTrailing();

    $n['root'] = $n['root']->replace(
      $n['name'],
      new QualifiedName(
        NodeList::createMaybeEmptyList(vec[
          new ListItem(null, new BackslashToken($leading, null)),
          new ListItem(new NameToken(null, $trailing, $new_name), null),
        ]),
      ),
    );

    return self::refToInout($n, $arg_idx);
  }

  /**
   * Convert by-ref argument to inout. Do nothing if already inout. Throw if
   * neither by-ref nor inout (this should have been a Hack error).
   *
   * Ex: reset(&$arr)
   * To: reset(inout $arr)
   */
  private static function refToInout(
    this::TNodes $n,
    int ...$arg_idxs
  ): Script {
    foreach ($arg_idxs as $arg_idx) {
      $n['root'] = self::refToInoutImpl($n, $arg_idx);
    }
    return $n['root'];
  }

  private static function refToInoutImpl(
    this::TNodes $n,
    int $arg_idx,
  ): Script {
    $arg = $n['args'][$arg_idx] ?? null;

    invariant(
      $arg is nonnull && self::isRefOrInout($arg),
      '%s expects by-ref or inout argument node, got "%s" (%s).',
      __METHOD__,
      $arg?->getCode(),
      \get_class($arg),
    );

    if (
      !$arg is PrefixUnaryExpression || !$arg->getOperator() is AmpersandToken
    ) {
      return $n['root'];  // already inout
    }

    // If there is nothing between "&" and the next token, insert a space.
    $trailing = $arg->getOperator()->getTrailing();
    if (
      $trailing->isEmpty() &&
      $arg->getOperand()->getFirstTokenx()->getLeading()->isEmpty()
    ) {
      $trailing = NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]);
    }

    return $n['root']->replace(
      $arg->getOperator(),
      new InoutToken($arg->getOperator()->getLeading(), $trailing),
    );
  }

  /**
   * Add one or more inout arguments at the specified position, if missing. If
   * any of the arguments already exist, convert them from by-ref to inout.
   * Optionally also add the specified by-value arguments before the inout
   * argument(s), if they are missing (this is needed because when converting an
   * optional argument to required, all previous arguments also need to be
   * changed to required).
   *
   * Ex: preg_replace_callback('/([a-z])/', fun('Str\\uppercase'), $str)
   * To: $__unused_inout = null;
   *     preg_replace_callback('/([a-z])/', fun('Str\\uppercase'), $str,
   *                           -1, inout $__unused_inout)
   */
  private static function optionalToRequired(
    this::TNodes $n,
    int $first_inout_arg_idx,
    int $inout_arg_count = 1,
    vec<string> $previous_defaults = vec[],
  ): Script {
    $last_old_arg_idx = C\count($n['args']) - 1;

    // Figure out how many arguments with the provided default values we need
    // to insert before the inout argument(s).
    $default_cnt = $first_inout_arg_idx - $last_old_arg_idx - 1;
    invariant(
      $default_cnt <= C\count($previous_defaults),
      'Need to add %d extra arguments but only %d values are available.',
      $default_cnt,
      C\count($previous_defaults),
    );

    $args_to_add = vec[];
    if ($default_cnt > 0) {
      $args_to_add = Vec\slice($previous_defaults, -$default_cnt)
        |> Vec\map($$, $code ==> self::expressionFromCode($code));
    }

    $existing_arg_idxs = vec[];
    $dummy_assignments = vec[];

    for ($i = 0; $i < $inout_arg_count; ++$i) {
      $inout_arg_idx = $first_inout_arg_idx + $i;

      if ($inout_arg_idx <= $last_old_arg_idx) {
        // Argument already exists, just convert it to inout below.
        $existing_arg_idxs[] = $inout_arg_idx;
        continue;
      }

      // Missing inout argument -- add it.
      $dummy_var_name = self::DUMMY_VARIABLE_NAME;
      if (!C\is_empty($dummy_assignments)) {
        $dummy_var_name .= '_'.(C\count($dummy_assignments) + 1);
      }
      $dummy_assignments[] = self::getDummyAssignment($dummy_var_name);

      $args_to_add[] = new DecoratedExpression(
        new InoutToken(null, null),
        new VariableToken(
          NodeList::createMaybeEmptyList(vec[new WhiteSpace(' ')]),
          null,
          '$'.$dummy_var_name,
        ),
      );
    }

    $new_call = add_arguments($n['root'], $n['call'], $args_to_add);

    return $n['root']->replace($n['call'], $new_call)
      |> prepend_statements($$, $dummy_assignments, $new_call)
      |> self::refToInout(
        shape(
          'root' => $$,
          'call' => $new_call,
          'name' => $n['name'],
          'args' => $n['args'],
        ),
        ...$existing_arg_idxs
      );
  }

  <<__Memoize>>
  private static function getDummyAssignment(string $var_name): IStatement {
    return \HH\Asio\join(
      self::statementFromCodeAsync('$'.$var_name.' = null;'),
    );
  }

  <<__Memoize>>
  private static function expressionFromCode(string $code): IExpression {
    return \HH\Asio\join(self::expressionFromCodeAsync($code));
  }

  private static function isRefOrInout(IExpression $arg): bool {
    return self::isRef($arg) ||
      $arg is DecoratedExpression && $arg->getDecorator() is InoutToken ||
      $arg is PrefixUnaryExpression && $arg->getOperator() is InoutToken;
  }

  private static function isRef(IExpression $arg): bool {
    return $arg is PrefixUnaryExpression &&
      $arg->getOperator() is AmpersandToken;
  }

  <<__Override>>
  public function migrateFile(string $_path, Script $root): Script {
    foreach (
      $root->getDescendantsOfType(FunctionCallExpression::class) as $node
    ) {
      // Only replace calls to functions from the root namespace.
      $receiver = $node->getReceiver();
      if ($receiver is NameToken) {
        $fn_name = $receiver->getText();
      } else if ($receiver is QualifiedName) {
        $fn_name = '';
        foreach ($receiver->getParts()->getChildren() as $part) {
          invariant(
            $part->getSeparator() is null ||
              $part->getSeparator() is BackslashToken,
            'Unexpected separator inside qualified function name: "%s"',
            $part->getSeparatorx()->getText(),
          );
          $fn_name .= $part->getItem()?->getText() ?? '';
          $fn_name .= $part->getSeparator()?->getText() ?? '';
        }
      } else {  // probably a method call
        continue;
      }

      $resolved_name = resolve_function($fn_name, $root, $node);

      $rule = self::getRules()[$resolved_name] ?? null;

      if ($rule is nonnull) {
        $root = $rule(shape(
          'root' => $root,
          'call' => $node,
          'name' => $receiver,
          'args' => $node->getArgumentListx()->getChildrenOfItems(),
        ));
      }
    }

    return $root;
  }
}
