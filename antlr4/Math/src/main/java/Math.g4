grammar Math;

compileUnit
    : expr
    ;

expr
    : '(' expr ')' # parensExpr
    | op=('+' | '-') expr # unaryExpr
    | left=expr op=('*' | '/') right=expr # infixExpr
    | left=expr op=('+' | '-') right=expr # infixExpr
    | value=NUM # numberExpr
    ;

OP_ADD : '+';
OP_SUB : '-';
OP_MUL : '*';
OP_DIV : '/';

NUM : [0-9]+ ('.' [0-9]+)? ([eE] [+-]? [0-9]+)?;
ID  : [a-zA-Z]+;
WS  : [ \t\n\r] -> skip;