# 3X5 Card programming: Writing your first Grammar rules

## Abstract

Let's create a grammar for a very tiny subset of JSON
This will only take about 8 lines of Extended Backus Naur Form (EBNF)

## Rationale

By repeatedly performing this small exercise, you begin to build muscle memory
which reinforces your skill set for creating lgrammars, which helps you understand
other's BNF rules you might encounter.


See below for  some history and context on the concept of 3X5 index card

## The language to design

We'll take a very small subset of JSON as our example language to build
some grammar rules.

```JSON
{ "reading 1": 105, "reading 2": 102 }
```

```JSON
{ "group 1": {
  "subnet":3429762048,
  "addr": 3429762099
  }
``` 



## Extended Backus Naur Form syntax

To cut down on the clutter of the many variations of EBNF out there,  we will
rely on the simple syntax here  to reduce the need to write   more than absolutely
needed to get the job done:

We will use the flavor of EBNF that borrows operators from RegEx land:

- * : 0 or more repeatations
- + : 1 or more  repetitions
- ? : Optional: 0 or 1 exactly
- '( .. )' : Grouping

### Nonterminals

Use CamelCase or simple capitalizations for a nonterminal. Here are some examples:

```EBNF
NonTerminal  ::= Alpha Beta
Alpha ::= 'a' | 'A'
Beta ::= 'b' | 'B'
```



### Terminals

Terminals are literal synbols or characters that cannot be further subdivided.
Represent  a terminal with 2 possible syntax forms:

- Single quoted string:
- Character class used in RegEx including character ranges

#### Example of single quoted strings

```
'{' | '}'
'name' | ','
'1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9'
```


 #### Example of character class  terminals

Use character classes for reducing the number of alternative individual
single quoted terminals. For example, we can reduce the above last example to:

```
[1-9]
```


## Approach

A language's grammar can be thought of consisting of a number of rules
that are built out of combinations of NonTerminals and terminals in various combinations.
It is similar to how chemical molecules are built out of single atoms and 
possible other molecules. Think of hydrocarbons and polymers.
A polymer is a chain of macro-molecules. A macro molecule is a molecule containing
a large number of atoms.

So, let's start with defining the atoms of our grammar. Start your definition
at the bottom of your index card.  Gradually build up larger andlarger NonTerminals
from first just terminals, and then smaller nonterminals.
Keep adding nonterminal definitions above the smaller units you have previously
designed.

In our example language we should need about 10 nonterminals defined. The terminals
are harder to count since we use some character classes with ranges. But
we have 62 letters and numbers plus 1 ':' and 1 ',' and 1 '"' and 2 each
of '{' and '}' That should be 67 terminals  if all character classes
are fully expanded.

### Handling unlimited  repititions of terms

Consider that our language is unlimited in the numbers of key value pairsand
separated by ','s. Here is where EBNF comes to the rescue. We can use
the operators from RegEx world to represent such expressions.
You might place a terminal followed by a nonterminal inside a group then
place a repitition operator next after the group.

### Our language is contextfree

Our mini JSON-like language is a proper subset of its complete JSON brother.
And JSON is context free meaning that it can be infinitely nested within itself.
To handle this fact, we need to  reppresent some part of our language using recursion.
Recursion means that there must be both a recursive case and and a base case.
Can you spot where both of these cases reside in our grammar? 







### Purpose and historical context

This exercise was composed for BarCampGR held on Aug. 12th, 2023 and presented by
me (Ed Howland). The participants were asked to write an implementation of a DFA
to be the runtime for a DIY RegExp engine on 3X5 sized index cards. Alternatively,
they can use a simple note taker app on their laptops, tablets or phones. No IDEs or code editors
were explicitly not encouraged.

The inspiration for using this learning technique came from this video:

[William Byrd on The Most Beutiful Program ever written](https://www.youtube.com/watch?v=OyfBQmvr2Hc))

This talk was given at the Papers We Love in NYC on April 12th,  2017
Dr. Byrd says in this video that his mentor Dan Freidman (author of the Little Lisper)
said that if you can't express your idea on a 3X5 index card, then you are doing it wrong.
Specifically, the talk is about Lisp written in Lisp itself.
Alan Kay (of Smalltalk/OOP fame) compared the page 13 of the Lisp Programmer's 1.5
Manual to that of James Clark Maxwell's equations for electrom-magnetism.
The equations of Computer Science.

[McCarthy et al. LISP 1.5 Programmer's Manual Software Preservation Group](https://www.softwarepreservation.org/projects/LISP/book/LISP 1.5 Programmers Manual.pdf/view contents selected Search with Google or enter address edit text](https://www.softwarepreservation.org/projects/LISP/book/LISP%201.5%20Programmers%20Manual.pdf/view)

### Dr. William Byrd's  professional web page

[William E. Byrd](http://webyrd.net/)

