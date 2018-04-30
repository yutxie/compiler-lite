grammar Mx;

// --------------------- parser ---------------------------

program
    : (classDefinition | methodDefinition | definitionStatement)*
    ;

classDefinition
    : CLASS Identifier LBRACE memberVariable*
        (constructionMethodDefinition | methodDefinition)* RBRACE
    ;

    memberVariable
        : variableType Identifier SEMI
        ;

    constructionMethodDefinition
        : Identifier LPAREN formalParameterList? RPAREN block
        ;

methodDefinition
    : variableType Identifier
        LPAREN formalParameterList? RPAREN block
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

block
    : LBRACE blockOrStatement* RBRACE
    ;

    blockOrStatement
        : block
        | statement
        ;

statement
    : definitionStatement # definitionStat
    | expression SEMI # expressionStat
    | IF LPAREN expression RPAREN blockOrStatement (ELSE blockOrStatement)? # ifStat
    | FOR LPAREN init=expression? SEMI condition=expression? SEMI after_block=expression? RPAREN blockOrStatement # forStat
    | WHILE LPAREN expression RPAREN blockOrStatement # whileStat
    | RETURN expression? SEMI # returnStat
    | BREAK SEMI # breakStat
    | CONTINUE SEMI # continueStat
    | SEMI # emptyStat
    ;

    definitionStatement
        : definitionExpression SEMI
        ;

expression
    : caller=expression LPAREN actualParameterList? RPAREN # methodCallExpr
    | caller=expression op=DOT member=expression # memberAccessExpr
    | caller=expression LBRACK index=expression RBRACK # indexAccessExpr
    | expression postfix=(INC | DEC) # unaryExpr
    | prefix=(INC | DEC) expression # unaryExpr
    | prefix=(ADD | SUB) expression # unaryExpr
    | prefix=(NOT | LNOT) expression # unaryExpr
    | NEW creator # newExpr
    | lhs=expression op=(MUL | DIV | MOD) rhs=expression # binaryExpr
    | lhs=expression op=(ADD | SUB) rhs=expression # binaryExpr
    | lhs=expression op=(LSHIFT | RSHIFT) rhs=expression # binaryExpr
    | lhs=expression op=(LE | GE | LT | GT) rhs=expression # binaryExpr
    | lhs=expression op=(EQUAL | NOTEQUAL) rhs=expression # binaryExpr
    | lhs=expression op=AND rhs=expression # binaryExpr
    | lhs=expression op=XOR rhs=expression # binaryExpr
    | lhs=expression op=OR rhs=expression # binaryExpr
    | lhs=expression op=LAND rhs=expression # binaryExpr
    | lhs=expression op=LOR rhs=expression # binaryExpr
    | definitionExpression # definitionExpr
    | lhs=expression op=ASSIGN rhs=expression # binaryExpr
    | Identifier # identifierExpr
    | constant # constantExpr
    | THIS # thisExpr
    | LPAREN expression RPAREN # parensExpr
    ;

    definitionExpression
        : variableType Identifier (ASSIGN expression)?
        ;

    creator
        : variableType (LPAREN actualParameterList? RPAREN)?
        ; // ATTENTION: int a = new int[...](...) is literally legal

        variableType
            : (Identifier | primitiveType) arrayCreatorRest # arrayVariableType
            | (Identifier | primitiveType) # nonArrayVariableType
            ;

            arrayCreatorRest
                : (LBRACK expression RBRACK)+ (LBRACK RBRACK)*
                | (LBRACK RBRACK)+
                ;

// ------------------ lexer ----------------------

LPAREN : '(';
RPAREN : ')';
LBRACE : '{';
RBRACE : '}';
LBRACK : '[';
RBRACK : ']';
SEMI : ';';
COMMA : ',';
DOT : '.';
ASSIGN : '=';
INC : '++';
DEC : '--';
ADD : '+';
SUB : '-';
MUL : '*';
DIV : '/';
MOD : '%';
LAND : '&&';
LOR : '||';
LNOT : '!';
LSHIFT : '<<';
RSHIFT : '>>';
NOT : '~';
OR : '|';
AND : '&';
XOR : '^';
LT : '<';
GT : '>';
EQUAL : '==';
LE : '<=';
GE : '>=';
NOTEQUAL : '!=';


IF : 'if';
ELSE : 'else';
FOR : 'for';
WHILE : 'while';
BREAK : 'break';
CONTINUE : 'continue';
RETURN : 'return';
CLASS : 'class';
NEW : 'new';
THIS : 'this';

primitiveType
    : BOOL | INT | VOID
    ;

    BOOL : 'bool';
    INT : 'int';
//    STRING : 'string';
    VOID : 'void';

constant
    : LogicConstant
    | IntegerConstant
    | StringConstant
    | NullConstant
    ;

    LogicConstant
        : 'true' | 'false'
        ;

    IntegerConstant
        : DecimalConstant
        ;

        fragment
        DecimalConstant
            : [1-9] [0-9]*
            | '0'
            ;

    StringConstant
        : '"' (~["\\\r\n] | EscapeSequence)* '"'
        ;

            fragment
            EscapeSequence
                : '\\' [btnfr"'\\]
                ;

    NullConstant
        : 'null'
        ;

Identifier
    : [a-zA-Z] [0-9a-zA-Z_]*
    ;



WhiteSpace
    : [ \t]+ -> skip
    ;

NewLine
    : [\n\r]+ -> skip
    ;

LineComment
    : '//' ~[\r\n]* -> skip
    ;

BlockComment
    : '/*' .*? '*/' -> skip
    ;
