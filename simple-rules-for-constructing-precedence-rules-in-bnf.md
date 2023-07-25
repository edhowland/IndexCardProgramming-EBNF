# Simple rules for constructing precedence rules for BNF grammars

## Abstract

Some languages like Regular Expression syntax and arithmetic expressions
that incorporate infix operators with differing levels of precedence need to
explicitly subjugate operators into levels of indirection in grammar rules.

The canonical "Hello World" of BNF is the arithmetic levels for infix operators.


Arithmetic Expression:

0. Grouping : '(' Expression ')'
1. Exponent '^N' or Superscript N
2. Multiplication operators: '*', '/'
3. Additive operators: '+', '-'
4. numbers : 0-9+


## First: Arrangement

 Arrange the rules from top down in order of lowest to highest precedence.

We are going to need to thread these rules together so lowest rules refer
to higher rules.

## Second: Create pseudo nonterminals to hang parts of rules together.


This part is tricky because in CS the hardest thing is naming things.
You want the nonterminal names to be meaningful but there are no real life examples
to draw upon.

