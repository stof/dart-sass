// Copyright 2017 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../import/dynamic.dart';
import '../statement.dart';
import 'function_rule.dart';
import 'import_rule.dart';
import 'mixin_rule.dart';
import 'variable_declaration.dart';

/// A [Statement] that can have child statements.
abstract class ParentStatement implements Statement {
  /// The child statements of this statement.
  final List<Statement> children;

  /// Whether any of [children] is a variable, function, or mixin declaration,
  /// or a dynamic import rule.
  final bool hasDeclarations;

  ParentStatement(this.children)
      : hasDeclarations = children?.any((child) =>
                child is VariableDeclaration ||
                child is FunctionRule ||
                child is MixinRule ||
                (child is ImportRule &&
                    child.imports.any((import) => import is DynamicImport))) ??
            false;
}
