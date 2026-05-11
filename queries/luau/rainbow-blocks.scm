(function_declaration
  "function" @delimiter
  "end" @delimiter) @container

(function_definition
  "function" @delimiter
  "end" @delimiter) @container

(if_statement
  "if" @delimiter
  "then" @delimiter
  (elseif_statement
    "elseif" @delimiter
    "then" @delimiter)*
  (else_statement
    "else" @delimiter)?
  "end" @delimiter) @container

(while_statement
  "while" @delimiter
  "do" @delimiter
  "end" @delimiter) @container

(repeat_statement
  "repeat" @delimiter
  "until" @delimiter) @container

(for_statement
  "for" @delimiter
  (for_generic_clause
    "in" @delimiter)?
  "do" @delimiter
  "end" @delimiter) @container

(do_statement
  "do" @delimiter
  "end" @delimiter) @container

(arguments
  "(" @delimiter
  ")" @delimiter) @container

(parameters
  "(" @delimiter
  ")" @delimiter) @container

(parenthesized_expression
  "(" @delimiter
  ")" @delimiter) @container

(table_constructor
  "{" @delimiter
  "}" @delimiter) @container

(bracket_index_expression
  "[" @delimiter
  "]" @delimiter) @container

(field
  "[" @delimiter
  "]" @delimiter) @container
