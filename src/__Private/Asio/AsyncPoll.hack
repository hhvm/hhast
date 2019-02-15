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
 * Asynchronous equivalent of mechanisms such as epoll(), poll() and select().
 *
 * Transforms a set of Awaitables to an asynchronous iterator that produces
 * results of these Awaitables as soon as they are ready. The order of results
 * is not guaranteed in any way. New Awaitables can be added to the AsyncPoll
 * while it is being iterated.
 */
final class AsyncPoll<Tv> implements AsyncIterator<Tv> {
  public static function create(): this {
    return new self();
  }

  public static function from(Traversable<Awaitable<Tv>> $awaitables): this {
    $poll = new self();
    $poll->addMulti($awaitables);
    return $poll;
  }

  private ?AsyncConditionNode<(mixed, Tv)> $lastAdded;
  private ?AsyncConditionNode<(mixed, Tv)> $lastNotified;
  private ?AsyncConditionNode<(mixed, Tv)> $lastAwaited;
  private Awaitable<void> $notifiers;

  private function __construct() {
    $head = new AsyncConditionNode();
    $this->lastAdded = $head;
    $this->lastNotified = $head;
    $this->lastAwaited = $head;
    $this->notifiers = async {};
  }

  public function add(Awaitable<Tv> $awaitable): void {
    invariant(
      $this->lastAdded !== null,
      'Unable to add item, iteration already finished',
    );

    // Create condition node representing pending event.
    $this->lastAdded = $this->lastAdded->addNext();

    // Make sure the next pending condition is notified upon completion.
    $awaitable = $this->waitForThenNotifyAsync($awaitable);

    // Keep track of all pending events.
    $this->notifiers = AwaitAllWaitHandle::fromVec(vec[
      $awaitable,
      $this->notifiers,
    ]);
  }

  public function addMulti(Traversable<Awaitable<Tv>> $awaitables): void {
    invariant(
      $this->lastAdded !== null,
      'Unable to add item, iteration already finished',
    );
    $last_added = $this->lastAdded;

    // Initialize new list of notifiers.
    $notifiers = vec[$this->notifiers];

    foreach ($awaitables as $awaitable) {
      // Create condition node representing pending event.
      $last_added = $last_added->addNext();

      // Make sure the next pending condition is notified upon completion.
      $notifiers[] = $this->waitForThenNotifyAsync($awaitable);
    }

    // Keep track of all pending events.
    $this->lastAdded = $last_added;
    $this->notifiers = AwaitAllWaitHandle::fromVec($notifiers);
  }

  private async function waitForThenNotifyAsync(
    Awaitable<Tv> $awaitable,
  ): Awaitable<void> {
    try {
      $result = await $awaitable;
      invariant($this->lastNotified !== null, 'unexpected null');
      $this->lastNotified = $this->lastNotified->getNext();
      invariant($this->lastNotified !== null, 'unexpected null');
      $this->lastNotified->succeed(tuple(null, $result));
    } catch (\Exception $exception) {
      invariant($this->lastNotified !== null, 'unexpected null');
      $this->lastNotified = $this->lastNotified->getNext();
      invariant($this->lastNotified !== null, 'unexpected null');
      $this->lastNotified->fail($exception);
    }
  }

  /* HHAST_IGNORE_ERROR[AsyncFunctionAndMethod] required by builtin interface */
  public async function next(): Awaitable<?(mixed, Tv)> {
    invariant(
      $this->lastAwaited !== null,
      'Unable to iterate, iteration already finished',
    );

    $this->lastAwaited = $this->lastAwaited->getNext();
    if ($this->lastAwaited === null) {
      // End of iteration, no pending events to await.
      $this->lastAdded = null;
      $this->lastNotified = null;
      return null;
    }

    return await $this->lastAwaited->waitAsync($this->notifiers);
  }
}
