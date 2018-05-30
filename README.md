# Compiler-Lite
ACM Class 2018 Compiler

## Q&A

## To-Do

- generate code
  - array and malloc
  - class member var and method
- optimization
  - coloring start over
  - reduce #reserved register
  - static single assignment
  - coalesce interference graph
    - reduce mov x, x
  - leaf method
    - inline
    - reduce sub rsp

## To-Fix

- def and use in index/member access
- replace set by cmov
- global allocation
- built-in class and method

## Process

- front end: scr -g4-> parse tree -AstBuilder-> AST -IRGenerator-> IR
- back end:
  - trivial: IR (var) -TrivialRegisterAllocator-> IR (spill code) -> #
  - non-trivial: IR (linear) -CFGGenerator-> IR (CFG) -RegisterAllocator-> IR (linear, spill code) -> #

## Structure

### Lexer

- Operator: Separator/Assignment/In(De)crease/Arithmetic/Logic/Relationship
- Keyword: PrimitiveType/etc
- Constant: Logic/Integer/String/Null
- Identifier
- SpecialToken: WhiteSpace/NewLine/Comment

### Parser

- program: classDefinition/methodDefinition/definitionStatement
- classDefinition: memberVariable/memberMethod
- method(function)Definition
- block/statement: definition/expression/condition/loop/jump/empty
- expression: identifier/constant/this/definition/memberAccess/indexAccess/methodCall/parens/new/unary/binary

### AstNode Hierarchy

- ProgramNode
- ClassDefinitionNode
- MethodDefinitionNode
- BlockNode/StatementNode
  - ExpressionStatementNode
    - PrimaryNode: ReferenceNode, ConstantNode, ThisNode
    - DefinitionExpressionNode
    - Member/IndexAccessExpressionNode
    - MethodCallExpressionNode
    - NewExpressionNode
    - Unary/BinaryExpressionNode
    - TypeNode
      - MethodType
      - VariableType
        - NonArrayType: PrimitiveType, ClassType
        - ArrayType
  - IfStatement
  - LoopStatement: For/WhileStatementNode
  - ReturnStatementNode
  - Break/ContinueStatementNode
  - EmptyStatementNode

### Scope Tree

- mapped to AST
- also as symbol table

## Variable

- (normal) Variable
- Member/IndexVariable: implement with load & store

### IR Code (2-address code)

- Allocate
- Move
- Calculate
- MethodCall
- Return
- Jump

## Hint

- visitor interface
- local var instead of stack

## Reference

- 自制编译器 - 青木峰郎
- The Definitive ANTLR4 Reference
- [antlr/grammars-v4 at GitHub](https://github.com/antlr/grammars-v4/tree/master/java)
- [ANTLR4使用技巧](https://abcdabcd987.com/using-antlr4/)
- [compiler2016 by abcdabcd987 at GitHub](https://github.com/abcdabcd987/compiler2016)