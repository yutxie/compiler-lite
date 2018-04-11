lexer grammar MxLexer;

Operator
    : SeparatorOperator
    | AssignmentOperator
    | InDecreaseOperator
    | ArithmeticOperator
    | LogicOperator
    | BitOperator
    | RelationshipOperator
    ;

    SeparatorOperator
        : LPAREN | RPAREN
        | LBRACE | RBRACE
        | LBRACK | RBRACK
        | SEMI | COMMA | DOT
        ;

        LPAREN : '(';
        RPAREN : ')';
        LBRACE : '{';
        RBRACE : '}';
        LBRACK : '[';
        RBRACK : ']';
        SEMI : ';';
        COMMA : ',';
        DOT : '.';

    AssignmentOperator
        : ASSIGN
        ;

        ASSIGN : '=';

    InDecreaseOperator
        : INC | DEC
        ;

        INC : '++';
        DEC : '--';

    ArithmeticOperator
        : ADD | SUB | MUL | DIV | MOD
        ;

        ADD : '+';
        SUB : '-';
        MUL : '*';
        DIV : '/';
        MOD : '%';

    LogicOperator
        : LAND | LOR | LNOT
        ;

        LAND : '&&';
        LOR : '||';
        LNOT : '!';

    BitOperator
        : LSHIFT | RSHIFT | NOT | OR | AND | XOR
        ;

        LSHIFT : '<<';
        RSHIFT : '>>';
        NOT : '~';
        OR : '|';
        AND : '&';
        XOR : '^';

    RelationshipOperator
        : LT | GT | EQUAL | LE | GE | NOTEQUAL
        ;

        LT : '<';
        GT : '>';
        EQUAL : '==';
        LE : '<=';
        GE : '>=';
        NOTEQUAL : '!=';


Keyword
    : VariableType
    | NullConstant
    | LogicConstant
    | ConditionWord
    | LoopWord
    | JumpWord
    | ObjectiveWord
    ;

    ConditionWord
        : IF | ELSE
        ;

            IF : 'if';
            ELSE : 'else';

    LoopWord
        : FOR | WHILE
        ;

            FOR : 'for';
            WHILE : 'while';

    JumpWord
        :  BREAK | CONTINUE | RETURN
        ;
        
            BREAK : 'break';
            CONTINUE : 'continue';
            RETURN : 'return';

    ObjectiveWord
        : CLASS | NEW | THIS
        ;
        
        CLASS : 'class';
        NEW : 'new';
        THIS : 'this';

VariableType
    : BOOL | INT | STRING | VOID
    ;

        BOOL : 'bool';
        INT : 'int';
        STRING : 'string';
        VOID : 'void';

Constant
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
            ;

    StringConstant
        : '"' (~["\\\r\n] | EscapeSequence)* '"'
        ;

            fragment EscapeSequence
                : '\\' [btnfr"'\\]
                ;

    NullConstant
        : 'null'
        ;

Identifier
    : [a-zA-Z] [0-9a-zA-Z_]*
    ;

SpecialToken
    : WhiteSpace | NewLine | Comment
    ;

    WhiteSpace
        : [ \t]+ -> skip
        ;

    NewLine
        : [\n\r]+ -> skip
        ;

    Comment
        : LineComment | BlockComment
        ;

            LineComment
                : '//' ~[\r\n]* -> skip
                ;

            BlockComment
                : '/*' .*? '*/' -> skip
                ;