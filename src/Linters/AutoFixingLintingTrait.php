<?hh // strict
/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST\Linters;

use namespace Facebook\HHAST\__Private\{LSP, LSPLib};

trait AutoFixingLinterTrait<Terror as FixableLintError> implements AutoFixingLinter<Terror> {
	final public function getCodeActionForError(
		Terror $error,
	): ?LSP\CodeAction {
    $fixed = $this->getFixedFile([$error]);
		if ($fixed === null) {
			return null;
		}

		return shape(
			'title' => $this->getTitleForFix($error),
			'kind' => LSP\CodeActionKind::QUICK_FIX,
			'edit' => shape(
				'changes' => dict[
					'file://'.\realpath($this->getFile()->getPath()) =>
						LSPLib\create_textedits(
							$this->getFile()->getContents(),
							$fixed->getContents()
						),
				],
			),
		);
	}

}
