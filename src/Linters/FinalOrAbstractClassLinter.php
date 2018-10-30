<?hh // strict

namespace Facebook\HHAST\Linters;

use type Facebook\HHAST\{
  ClassishDeclaration,
  EditableNode,
  FinalToken,
  AbstractToken,
  ClassToken,
};

use type Facebook\HHAST\Linters\{ASTLinter, ASTLintError};
use namespace HH\Lib\{Str, C};

#
# This linter ensures we always qualify classes as final or abstract
#
final class FinalOrAbstractClassLinter extends ASTLinter<ClassishDeclaration> {

	<<__Override>>
	protected static function getTargetType(): classname<ClassishDeclaration> {
		return ClassishDeclaration::class;
	}

	<<__Override>>
	public function getLintErrorForNode(
		ClassishDeclaration $node,
		vec<EditableNode> $parents,
		): ?ASTLintError<ClassishDeclaration> {
		# ensure we are looking at a class declaration
		if (!($node->getKeyword() is ClassToken)) {
			return null;
		}
		
		# check if the ClassishDeclaration has modifiers
		$modifiers = $node->getModifiers();
		$found = false;
		if ($modifiers !== null) {
			foreach ($modifiers->traverse() as $mod) {
				if ($mod is FinalToken || $mod is AbstractToken) {
					$found = true;
				}
			}
		}
		if (!$found) {
			return new ASTLintError(
				$this,
				'Class should always be declared abstract or final',
				$node,
			);
		}
		return null;
	}
}
