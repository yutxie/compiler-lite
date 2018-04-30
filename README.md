# compiler-lite
ACM Class 2018 Compiler

## To-Do

- semantic analysis

## To-Fix

- auto type transform

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
  - If/For/WhileStatementNode
  - ReturnStatementNode
  - Break/ContinueStatementNode
  - EmptyStatementNode
  - TypeNode
    - MethodType
    - VariableType
      - NonArrayType: PrimitiveType, ClassType
      - ArrayType

## Hint

- visitor interface

## Reference

- 自制编译器 - 青木峰郎
- The Definitive ANTLR4 Reference
- [antlr/grammars-v4 at GitHub](https://github.com/antlr/grammars-v4/tree/master/java)
- [ANTLR4使用技巧](https://abcdabcd987.com/using-antlr4/)
- [compiler2016 by abcdabcd987 at GitHub](https://github.com/abcdabcd987/compiler2016)