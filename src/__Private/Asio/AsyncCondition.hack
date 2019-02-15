/*
 *  Copyright (c) 2015-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\__Private\Asio;

/**
 * A wrapper around ConditionWaitHandle that allows notification events
 * to occur before the condition is awaited.
 */
class AsyncCondition<T> {
  private ?Awaitable<T> $condition = null;

  /**
   * Notify the condition variable of success and set the result.
   */
  final public function succeed(T $result): void {
    if ($this->condition === null) {
      $this->condition = async {
        return $result;
      };
    } else {
      invariant(
        $this->condition instanceof ConditionWaitHandle,
        'Unable to notify AsyncCondition twice',
      );
      $this->condition->succeed($result);
    }
  }

  /**
   * Notify the condition variable of failure and set the exception.
   */
  final public function fail(\Exception $exception): void {
    if ($this->condition === null) {
      $this->condition = async {
        throw $exception;
      };
    } else {
      invariant(
        $this->condition instanceof ConditionWaitHandle,
        'Unable to notify AsyncCondition twice',
      );
      $this->condition->fail($exception);
    }
  }

  /**
   * Asynchronously wait for the condition variable to be notified and
   * return the result or throw the exception received via notification.
   *
   * The caller must provide an Awaitable $notifiers that must not finish
   * before the notification is received. This means $notifiers must represent
   * work that is guaranteed to eventually trigger the notification. As long
   * as the notification is issued only once, asynchronous execution unrelated
   * to $notifiers is allowed to trigger the notification.
   */
  final public async function waitAsync(Awaitable<void> $notifiers): Awaitable<T> {
    if ($this->condition === null) {
      $this->condition = ConditionWaitHandle::create($notifiers);
    }
    return await $this->condition;
  }
}
