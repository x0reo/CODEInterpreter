grammar CODE;
/* some keys my laptop cant type apparently: | \ - _ */
program: 'BEGIN CODE' programBegin;

programBegin: line* 'END CODE';

line: statement | ifBlock | whileBlock | block | comment;

statement: (assignment | functionCall) WS;

IF: 'IF';

ifBlock: IF '(' expression ')' 'BEGIN IF' line* 'END IF' ('else' elseIfBlock);

elseIfBlock: block | ifBlock;

whileBlock: WHILE expression block ('else' elseIfBlock);

WHILE: 'while' | 'until';

assignment: IDENTIFIER '=' expression;

functionCall: IDENTIFIER ':' (expression (',' expression)*)?;

comment: '#' line*;

expression
    : constant                              #constantExpression
    | IDENTIFIER                            #identifierExpression
    | functionCall                          #functionCallExpression
    | '!' expression                        #notExpression
    | expression multOp expression          #multiplicativeExpression
    | expression addOp expression           #additiveExpression
    | expression compareOp expression       #comparisonExpression
    | expression boolOp expression          #booleanExpression
    ;
    
multOp: '*' | '/' | '%';
addOp: '+' | '-' | '&';
compareOp: '==' | '!=' | '>' | '<' | '>=' | '<=';
boolOp: BOOL_OPERATOR;

BOOL_OPERATOR: 'and' | 'or' | 'xor';

constant: INTEGER | FLOAT | STRING | BOOL | NULL;

INTEGER: [0-9]+;
FLOAT: [0-9]+ '.' [0-9]+;
STRING: ('"' ~'"'* '"') | ('\'' ~'\''* '\'');
BOOL: 'true' | 'false';
NULL: 'null';

block: '{' line* '}';

WS: [ \t\r\n]+ -> skip;
IDENTIFIER: ([a-zA-Z_][a-zA-Z0-9_]*);





