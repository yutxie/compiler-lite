parser grammar MxParser;

options { tokenVocab = MxLexer; }

program
    : (classDefinition | methodDefinition | statement)*
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
    : variableType Identifier (ASSIGN expression)?
        (COMMA Identifier (ASSIGN expression)?)* SEMI # DefinitionStatement
    | expressionList SEMI # expressionStatement
    | IF LPAREN expression RPAREN blockOrStatement (ELSE blockOrStatement)? # ifStatement
    | FOR LPAREN expression SEMI expression SEMI expression RPAREN blockOrStatement # forStatement
    | WHILE LPAREN expression RPAREN blockOrStatement # whileStatement
    | RETURN expression SEMI # returnStatement
    | BREAK SEMI # breakStatement
    | CONTINUE SEMI # continueStatement
    | SEMI # emptyStatement
    ;

expression
    : Identifier # identifierExpression
    | Constant # constantExpression
    | THIS # thisExpression
    | expression bop=DOT (Identifier | THIS) # memberAccessExpression
    | expression LBRACK expression RBRACK # indexAccessExpression
    | expression LPAREN actualParameterList? RPAREN # methodCallExpression
    | NEW creator # newExpression
    | expression postfix=(INC | DEC) # unaryExpression
    | prefix=(INC | DEC) expression # unaryExpression
    | prefix=(ADD | SUB) expression # unaryExpression
    | prefix=(NOT | LNOT) expression # unaryExpression
    | expression bop=(MUL | DIV | MOD) expression # binaryExpression
    | expression bop=(ADD | SUB) expression # binaryExpression
    | expression bop=(LSHIFT | RSHIFT) expression # binaryExpression
    | expression bop=(LE | GE | LT | GT) expression # binaryExpression
    | expression bop=(EQUAL | NOTEQUAL) expression # binaryExpression
    | expression bop=AND expression # binaryExpression
    | expression bop=XOR expression # binaryExpression
    | expression bop=OR expression # binaryExpression
    | expression bop=LAND expression # binaryExpression
    | expression bop=LOR expression # binaryExpression
    | expression bop=ASSIGN expression # binaryExpression
    ;

    creator
        : variableType actualParameterList
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