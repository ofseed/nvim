; extends

; Workaround for https://github.com/tree-sitter/tree-sitter-typescript/issues/282
(call_expression
  function: (await_expression
    (identifier) @function.call))
