parser grammar MxParser;

options { tokenVocab = MxLexer; }

definition
    : variableDefinition
    | functionDefinition
    | classDefinition
    ;

    variableDefinition
        : 
        ;

    functionDefinition
        :
        ;

    classDefinition
        :
        ;

statement
    :
    ;

expression
    : singleTermExpression
    | doubleTermExpression
    ;

    singleTermExpression
        : primary
        | postExpression
        | prfExpression
        | parExpression
        | newExpression
        ;

        primary
            : THIS
            | Constant
            | Identifier
            ;

        postExpression
            : expression postfix=('++' | '--')
            ;

        preExpression
            : prefix=('+' | '-' | '++' | '--') expression
            : prefix=('~' | '!') expression
            ;

        parExpression
            : '(' expression ')'
            ;

        newExpression
            : NEW Identifier
            | NEW methodCall
            ;

    doubleTermExpression
        : arithmeticExpression
        | dotExpression
        | indexExpression
        | methodCall
        ;

        arithmeticExpression
            : expression bop=AssignmentOperator expression
            | expression bop=ArithmeticOperator expression
            | expression bop=('==' | '!=' | '&&' | '||') epxression
            | expression bop=('<<' | '>>' | '&' | '|' | '^') epxression
            | expression bop=RelationshipOperator expression
            ;

        dotExpression
            : expression bop=DOT (Identifier | methodCall | THIS)
            ;

        indexExpression
            : expression LBRACK expression RBRACK
            ;

        methodCall
            :
            ;
