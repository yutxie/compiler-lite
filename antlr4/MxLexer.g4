lexer grammar MxLexer;

Keyword
    : VariableType
    | NullConstant
    | LogicConstant
    | ControlStatementWord
    | ObjectiveWord
    ;

    VariableType
        : BOOL | INT | STRING | VOID
        ;

            BOOL : 'bool';
            INT : 'int';
            STRING : 'string';
            VOID : 'void';

    ControlStatementWord
        : IF | FOR | WHILE | BREAK | CONTINUE | RETURN
        ;

            IF : 'if';
            FOR : 'for';
            WHILE : 'while';
            BREAK : 'break';
            CONTINUE : 'continue';
            RETURN : 'return';

    ObjectiveWord
        : CLASS | NEW | THIS
        ;
        
        CLASS : 'class';
        NEW : 'new';
        THIS : 'this';

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
        :
        ; // ATTENTION

    NullConstant
        : 'null'
        ;

Identifier
    : ('a'..'z' | 'A'..'Z') ('0'..'9' | 'a'..'z' | 'A'..'Z' | '_')*
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