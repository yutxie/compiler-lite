# compiler-lite
ACM Class 2018 Compiler

## To-Do

- semantic analysis

## To-Fix

- regarded null as instance of void

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
  - ConstructionMethodDefinitionNode
- BlockNode/StatementNode
  - ExpressionStatementNode
    - PrimaryNode: ReferenceNode, ConstantNode, ThisNode
    - DefinitionExpressionNode
    - MemberAccessExpressionNode
    - IndexAccessExpressionNode
    - MethodCallExpressionNode
    - NewExpressionNode
    - Unary/BinaryExpressionNode
  - If/For/WhileStatementNode
  - ReturnStatementNode
  - Break/ContinueStatementNode
  - EmptyStatementNode

### Type

- MethodType
- VariableType
  - NonArrayType
    - PrimitiveType: int, bool, string, void, null
    - ClassType: class defined by user
  - ArrayType

## Commands

- antlr4

  ```CQL
  cd /usr/local/lib
  sudo curl -O https://www.antlr.org/download/antlr-4.7.1-complete.jar
  export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
  alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'
  alias grun='java org.antlr.v4.gui.TestRig'

  antlr4 Grammar.g4
  javac *.java
  grun Grammar rule -tree/tokens < code/xxx.txt
  ```

  ​

## Hint

- visitor interface

## Reference

- 自制编译器 - 青木峰郎
- [hand in hand with antlr](https://github.com/alan2lin/hand_in_hand_with_antlr)