parser grammar MxParser;

options { tokenVocab = MxLexer; }

program
    : (classDefinition | methodDefinition | definitionStatement)*
    ;

classDefinition
    : CLASS Identifier LBRACE classBody RBRACE
    ;

    classBody
        : memberVariable* memberMethod*
        ;

        memberVariable
            : variableType Identifier SEMI
            ;

        memberMethod
            : constructionMethodDefinition
            | methodDefinition
            ;

            constructionMethodDefinition
                : Identifier LPAREN formalParameterList? RPAREN block
                ;

methodDefinition
    : variableType Identifier LPAREN formalParameterList? RPAREN LBRACE methodBody RBRACE
    ;

    formalParameterList
        : formalParameter (COMMA formalParameter)*
        ;

        formalParameter
            : variableType Identifier (ASSIGN expression)?
            ;

    actualParameterList
        : expression (COMMA expression)*
        ;

    methodBody
        : statement*
        ; // ATTENTION: return ...

block
    : LBRACE statement* RBRACE
    ;

    blockOrStatement
        : block
        | statement
        ;

statement
    : definitionStatement # definitionStatement
    | expressionList SEMI # expressionStatement
    | IF LPAREN expression RPAREN blockOrStatement (ELSE blockOrStatement)? # ifStatement
    | FOR LPAREN expression SEMI expression SEMI expression RPAREN blockOrStatement # forStatement
    | WHILE LPAREN expression RPAREN blockOrStatement # whileStatement
    | RETURN expression SEMI # returnStatement
    | BREAK SEMI # breakStatement
    | CONTINUE SEMI # continueStatement
    | SEMI # emptyStatement
    ;

    definitionStatement
        : definitionExpression SEMI
        ;

expression
    : Identifier # identifierExpression
    | Constant # constantExpression
    | THIS # thisExpression
    | definitionExpression # definitionExpression
    | expression op=DOT (Identifier | THIS) # memberAccessExpression
    | caller=expression LBRACK index=expression RBRACK # indexAccessExpression
    | caller=expression LPAREN actual_parameter_list=actualParameterList? RPAREN # methodCallExpression
    | LPAREN expression RPAREN # parensExpression
    | NEW creator # newExpression
    | expression postfix=(INC | DEC) # unaryExpression
    | prefix=(INC | DEC) expression # unaryExpression
    | prefix=(ADD | SUB) expression # unaryExpression
    | prefix=(NOT | LNOT) expression # unaryExpression
    | lhs=expression op=(MUL | DIV | MOD) rhs=expression # binaryExpression
    | lhs=expression op=(ADD | SUB) rhs=expression # binaryExpression
    | lhs=expression op=(LSHIFT | RSHIFT) rhs=expression # binaryExpression
    | lhs=expression op=(LE | GE | LT | GT) rhs=expression # binaryExpression
    | lhs=expression op=(EQUAL | NOTEQUAL) rhs=expression # binaryExpression
    | lhs=expression op=AND rhs=expression # binaryExpression
    | lhs=expression op=XOR rhs=expression # binaryExpression
    | lhs=expression op=OR rhs=expression # binaryExpression
    | lhs=expression op=LAND rhs=expression # binaryExpression
    | lhs=expression op=LOR rhs=expression # binaryExpression
    | lhs=expression op=ASSIGN rhs=expression # binaryExpression
    ;

    definitionExpression
        : variableType id=Identifier (ASSIGN init_value=expression)?
        ;

    creator
        : variableType (LPAREN actualParameterList? RPAREN)?
        ; // ATTENTION: int a = new int[...](...) is literally legal

        variableType
            : (Identifier | PrimitiveType) # nonArrayVariableType
            | (Identifier | PrimitiveType) arrayCreatorRest # arrayVariableType
            ;

        arrayCreatorRest
            : LBRACK (RBRACK (LBRACK RBRACK)*
                        | expression RBRACK (LBRACK expression RBRACK)* (LBRACK RBRACK)*)
            ;


expressionList
    : expression (COMMA expression)*
    ;