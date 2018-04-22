# compiler-lite
ACM Class 2018 Compiler

## To-Do

- LocalResolver

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
    - PrimaryNode
      - IdentifierExpressionNode
      - ConstantExpressionNode
      - ThisExpressionNode
    - DefinitionExpressionNode
    - MemberAccessExpressionNode
    - IndexAccessExpressionNode
    - MethodCallExpressionNode
    - NewExpressionNode
    - UnaryExpressionNode
      - PostfixInc/DecNode
      - PrefixInc/DecNode
      - NegateNode
      - Not/LnotNode
    - BinaryExpressionNode
      - Mul/Div/Mod/Add/SubNode
      - Lshift/RshiftNode
      - Le/Ge/Lt/GtNode
      - Equal/NotEqualNode
      - And/Xor/Or/Land/LorNode
      - AssignNode
    - TypeNode
  - If/For/WhileStatementNode
  - ReturnStatementNode
  - Break/ContinueStatementNode
  - EmptyStatementNode

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