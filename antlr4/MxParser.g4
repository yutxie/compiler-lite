parser grammar MxParser;

options { tokenVocab = MxLexer; }

program
    : (classDef | method)*
    ;

classDef
    : CLASS Identifier LBRACE classBody RBRACE
    ;

    classBody
        : memberVariable* memberMethod
        ;

        memberVariable
            : (VariableType | Identifier) Identifier SEMI
            ;

        memberMethod
            : method
            | constructionMethod
            ;

            constructionMethod
                : Identifier LPAREN RPAREN block
                | Identifier LPAREN formalParameter RPAREN block
                ;

method
    : VariableType Identifier LPAREN formalParameterList? RPAREN LBRACE methodBody RBRACE
    ;

    formalParameterList
        :  formalParameter (COMMA formalParameter)*
        ;

        formalParameter
            : VariableType Identifier (ASSIGN expression)?
            ;

    actualParameterList
        : expression (COMMA expression)*
        ;

    methodBody
        : statement*
        ;

block
    : LBRACE statement* RBRACE
    ;

    blockOrStatement
        : block
        | statement
        ;

statement
    : (VariableType | Identifier) (Identifier (ASSIGN expression)?)+ SEMI # declarationStatement
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
        : 
        ;

expressionList
    : expression (COMMA expression)*
    ;