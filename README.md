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

### AST

- ClassDefinitionNode
- MethodDefinitionNode
- BlockNode/StatementNode
  - DefinitionStatementNode
  - ExpressionStatementNode
  - If/For/WhileStatementNode
  - ReturnStatementNode
  - Break/ContinueStatementNode
- ExpressionNode
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

## Commands

- antlr4

  ```CQL
  cd /usr/local/lib
  sudo curl -O https://www.antlr.org/download/antlr-4.7.1-complete.jar
  export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
  alias antlr4='java -jar /usr/local/lib/antlr-4.7.1-complete.jar'
  alias grun='java org.antlr.v4.gui.TestRig'

  antlr4 Grammar
  javac *.java
  grun Grammar rule -tree/tokens
  java AstVisitor
  ```

  ​

## Reference

- 自制编译器 - 青木峰郎
- [hand in hand with antlr](https://github.com/alan2lin/hand_in_hand_with_antlr)