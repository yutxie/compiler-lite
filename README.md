# compiler-lite
ACM Class 2018 Compiler

## To-Do

- translate parse tree to AST

## Structure

### Lexer

- Operator: Separator/Assignment/In(De)crease/Arithmetic/Logic/Relationship
- Keyword
- VariableType
- Constant: Logic/Integer/String/Null
- Identifier
- SpecialToken: WhiteSpace/NewLine/Comment

### Parser

- program: class/method
- class: memberVariable/memberMethod
- method (function)
- block / statement: declaration/expression/condition/loop/jump/empty
- expression

## Reference

- 自制编译器 - 青木峰郎
- [hand in hand with antlr](https://github.com/alan2lin/hand_in_hand_with_antlr)