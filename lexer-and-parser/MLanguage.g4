grammar MLanguage;

Class
    :
    ;

Function
    :
    ;

RerservedKeyword
    : VariableType
    | LogicConstant
    | ['if', 'for', 'while']
    | ['break', 'continue', 'return']
    | ['new', 'class', 'this']
    ;

WhiteSpace
    : [' ', '\t', '\r', '\n']+ ->skip
    ;

Comment
    : '//' (~[])* '\n'
    ;

Identifier
    : ['a'-'z', 'A'-'Z'] ['0'-'9', 'a'-'z', 'A'-'Z', '_']
    ; // ATTENTION: exempt keywords

Constant
    : LogicConstant
    | IntegerConstant
    | StringConstant
    | NullConstant
    ;

LogicConstant
    : 'true'
    | 'false'
    ;

IntegerConstant
    : ['-', ''] ['0'-'9']+
    ; // ATTENTION: range [-2^31, 2^31)

StringConstant
    : '"' 
    ;

CharacterConstant
    : [' ', '\t', '\r', '\n']
    ; // ATTENTION: \x

NullConstant
    : 'null'
    ;

Operator
    : ArithmeticOperator
    | RelationalOperator
    | LogicalOperator
    | BitOperator
    | AssignOperator
    | SelfAddOperator
    | ComponentOperator
    | IndexOperator
    | BracketsOperator
    ;

ArithmeticOperator
    : ['+', '-', '*', '.', '%']
    ;

RelationalOperator
    : ['<', '>', '==', '!=', '<=', '>=']
    ;

LogicalOperator
    : ['&&', '||', '!']
    ;

BitOperator
    : ['<<', '>>', '~', '|', '^', '&']
    ;

AssignOperator
    : '='
    ;

SelfAddOperator
    : ['++', '--']
    ;

ComponentOperator
    : '.'
    ;

IndexOperator
    : '[]'
    ; // ATTENTIION: [idx]

BracketsOperator
    : '()'
    ; // ATTENTION: (...) for calling func and subexpr

VariableType
    : 'bool'
    | 'int'
    | 'string'
    | 'null'
    | 'void'
    ;

    