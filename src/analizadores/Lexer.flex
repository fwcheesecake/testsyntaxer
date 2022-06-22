package analizadores;
import java_cup.runtime.*;

%%
%class Lexico
%type Symbol
%line
%column
%cup
%{
    private Symbol token(int id, int l, int r, String o){
        return new Symbol(id, l, r, o);
    }
%}
/* Variables, comentarios y espacios */
TerminadorDeLinea = \r|\n|\r\n
EntradaDeCaracter = [^\r\n]
EspacioEnBlanco = {TerminadorDeLinea} | [\ \t\f]
ComentarioTradicional = "/*" [^*] ~"*/" | "/*" "*"+ "/"
FinDeLineaComentario = "//" {EntradaDeCaracter}* {TerminadorDeLinea}?
ContenidoComentario = ( [^*] | \*+ [^/*] )*
ComentarioDeDocumentacion = "/**" {ContenidoComentario} "*"+ "/"
InputChar = [^\n\r]
SpaceChar = [\ \t]
LineChar = \n|\r|\r\n
Zero = 0
DecInt = [1-9][0-9]*
OctalInt = 0[0-7]+
HexInt = 0[xX][0-9a-fA-F]+
Integer = ( {Zero} | {DecInt} | {OctalInt} | {HexInt} )[lL]?
Exponent = [eE] [\+\-]? [0-9]+
Float1 = [0-9]+ \. [0-9]+ {Exponent}?
Float2 = \. [0-9]+ {Exponent}?
Float3 = [0-9]+ \. {Exponent}?
Float4 = [0-9]+ {Exponent}
Float = ( {Float1} | {Float2} | {Float3} | {Float4} ) [fFdD]? |
[0-9]+ [fFDd]
Ident = [A-Za-z_$] [A-Za-z_$0-9]*
CChar = [^\'\\\n\r] | {EscChar}
SChar = [^\"\\\n\r] | {EscChar}
EscChar = \\[ntbrf\\\'\"] | {OctalEscape}
OctalEscape = \\[0-7] | \\[0-7][0-7] | \\[0-3][0-7][0-7]
StringLit = \"[^\\\"]*\"
/* Comentarios */
Comentario = {ComentarioTradicional} | {FinDeLineaComentario} | {ComentarioDeDocumentacion}

/* Identificadores */
Letra = [A-Za-zÑñ_ÁÉÍÓÚáéíóúÜü]
Digito = [0-9]
Identificador = {Letra}({Letra}|{Digito})*

/* Números */
Numero = 0 | [1-9][0-9]*
%%

if { return token(sym.IF, yyline, yycolumn, yytext()); }
else { return token(sym.ELSE, yyline, yycolumn, yytext()); }
switch { return token(sym.SWITCH, yyline, yycolumn, yytext()); }
case { return token(sym.CASE, yyline, yycolumn, yytext()); }
default { return token(sym.DEFAULT, yyline, yycolumn, yytext()); }
while { return token(sym.WHILE, yyline, yycolumn, yytext()); }
do { return token(sym.DO, yyline, yycolumn, yytext()); }
for { return token(sym.FOR, yyline, yycolumn, yytext()); }
break { return token(sym.BREAK, yyline, yycolumn, yytext()); }
continue { return token(sym.CONTINUE, yyline, yycolumn, yytext()); }
return { return token(sym.RETURN, yyline, yycolumn, yytext()); }
final { return token(sym.FINAL, yyline, yycolumn, yytext()); }

boolean { return token(sym.BOOLEAN, yyline, yycolumn, yytext()); }
byte { return token(sym.BYTE, yyline, yycolumn, yytext()); }
short { return token(sym.SHORT, yyline, yycolumn, yytext()); }
int { return token(sym.INT, yyline, yycolumn, yytext()); }
long { return token(sym.LONG, yyline, yycolumn, yytext()); }
float { return token(sym.FLOAT, yyline, yycolumn, yytext()); }
double { return token(sym.DOUBLE, yyline, yycolumn, yytext()); }
String { return token(sym.STRING, yyline, yycolumn, yytext()); }
char { return token(sym.CHAR, yyline, yycolumn, yytext()); }
class { return token(sym.CLASS, yyline, yycolumn, yytext()); }

this { return token(sym.THIS, yyline, yycolumn, yytext()); }
static { return token(sym.STATIC, yyline, yycolumn, yytext()); }
new { return token(sym.NEW, yyline, yycolumn, yytext()); }
enum { return token(sym.ENUM, yyline, yycolumn, yytext()); }
assert { return token(sym.ASSERT, yyline, yycolumn, yytext()); }
native { return token(sym.NATIVE, yyline, yycolumn, yytext()); }
void { return token(sym.VOID, yyline, yycolumn, yytext()); }
strictfp { return token(sym.STRICTFP, yyline, yycolumn, yytext()); }
interface { return token(sym.INTERFACE, yyline, yycolumn, yytext()); }
implements { return token(sym.IMPLEMENTS, yyline, yycolumn, yytext()); }
abstract { return token(sym.ABSTRACT, yyline, yycolumn, yytext()); }
extends { return token(sym.EXTENDS, yyline, yycolumn, yytext()); }
super { return token(sym.SUPER, yyline, yycolumn, yytext()); }
catch { return token(sym.CATCH, yyline, yycolumn, yytext()); }
finally { return token(sym.FINALLY, yyline, yycolumn, yytext()); }
throw { return token(sym.THROW, yyline, yycolumn, yytext()); }
throws { return token(sym.THROWS, yyline, yycolumn, yytext()); }
try { return token(sym.TRY, yyline, yycolumn, yytext()); }
synchronized { return token(sym.SYNCHRONIZED, yyline, yycolumn, yytext()); }
volatile { return token(sym.VOLATILE, yyline, yycolumn, yytext()); }
transient { return token(sym.TRANSIENT, yyline, yycolumn, yytext()); }
null { return token(sym.NULL_LITERAL, yyline, yycolumn, yytext()); }

private { return token(sym.PRIVATE, yyline, yycolumn, yytext()); }
public { return token(sym.PUBLIC, yyline, yycolumn, yytext()); }
protected { return token(sym.PROTECTED, yyline, yycolumn, yytext()); }
package { return token(sym.PACKAGE, yyline, yycolumn, yytext()); }
import { return token(sym.IMPORT, yyline, yycolumn, yytext()); }

"++" { return token(sym.INCREMENT, yyline, yycolumn, yytext()); }
"--" { return token(sym.DECREMENT, yyline, yycolumn, yytext()); }
"&&" { return token(sym.LOGICAL_AND, yyline, yycolumn, yytext()); }
"||" { return token(sym.LOGICAL_OR, yyline, yycolumn, yytext()); }
"!" { return token(sym.LOGICAL_NOT, yyline, yycolumn, yytext()); }
\+ { return token(sym.PLUS, yyline, yycolumn, yytext()); }
"-" { return token(sym.MINUS, yyline, yycolumn, yytext()); }
"*" { return token(sym.TIMES, yyline, yycolumn, yytext()); }
"/" { return token(sym.DIVIDE, yyline, yycolumn, yytext()); }
"%" { return token(sym.MODULE, yyline, yycolumn, yytext()); }

"==" { return token(sym.EQUALS, yyline, yycolumn, yytext()); }
">=" { return token(sym.GREATER_EQUALS, yyline, yycolumn, yytext()); }
"<=" { return token(sym.SMALLER_EQUALS, yyline, yycolumn, yytext()); }
">" { return token(sym.GREATER, yyline, yycolumn, yytext()); }
"<" { return token(sym.SMALLER, yyline, yycolumn, yytext()); }
"!=" { return token(sym.DIFFERENT, yyline, yycolumn, yytext()); }

// \" { return token(sym.QUOTES, yyline, yycolumn, yytext()); }
"?:" { return token(sym.INTERROGATION, yyline, yycolumn, yytext()); }
"~" { return token(sym.BITWISE_NOT, yyline, yycolumn, yytext()); }
"<<" { return token(sym.LEFTSHIFT, yyline, yycolumn, yytext()); }
">>" { return token(sym.RIGHTSHIFT, yyline, yycolumn, yytext()); }
">>>" { return token(sym.DOUBLE_RIGHTSHIFT, yyline, yycolumn, yytext()); }
"|" { return token(sym.BITWISE_OR, yyline, yycolumn, yytext()); }
"&" { return token(sym.BITWISE_AND, yyline, yycolumn, yytext()); }
"^" { return token(sym.BITWISE_XOR, yyline, yycolumn, yytext()); }
"=" { return token(sym.ASSIGNMENT, yyline, yycolumn, yytext()); }
"+=" { return token(sym.PLUS_ASSIGNMENT, yyline, yycolumn, yytext()); }
"-=" { return token(sym.MINUS_ASSIGNMENT, yyline, yycolumn, yytext()); }
"*=" { return token(sym.TIMES_ASSIGNMENT, yyline, yycolumn, yytext()); }
"/=" { return token(sym.DIVIDE_ASSIGNMENT, yyline, yycolumn, yytext()); }
"%=" { return token(sym.MODULE_ASSIGNMENT, yyline, yycolumn, yytext()); }
"~=" { return token(sym.BITWISE_NOT_ASSIGNMENT, yyline, yycolumn, yytext()); }
"|=" { return token(sym.BITWISE_OR_ASSIGNMENT, yyline, yycolumn, yytext()); }
"&=" { return token(sym.BITWISE_AND_ASSIGNMENT, yyline, yycolumn, yytext()); }
"^=" { return token(sym.BITWISE_XOR_ASSIGNMENT, yyline, yycolumn, yytext()); }
"<<=" { return token(sym.LEFTSHIFT_ASSIGNMENT, yyline, yycolumn, yytext()); }
">>=" { return token(sym.RIGHTSHIFT_ASSIGNMENT, yyline, yycolumn, yytext()); }

"(" { return token(sym.LEFT, yyline, yycolumn, yytext()); }
")" { return token(sym.RIGHT, yyline, yycolumn, yytext()); }
"{" { return token(sym.LEFT_CURLY, yyline, yycolumn, yytext()); }
"}" { return token(sym.RIGHT_CURLY, yyline, yycolumn, yytext()); }
"[" { return token(sym.LEFT_BRACKET, yyline, yycolumn, yytext()); }
"]" { return token(sym.RIGHT_BRACKET,  yyline, yycolumn, yytext()); }
";" { return token(sym.SEMICOLON, yyline, yycolumn, yytext()); }
":" { return token(sym.COLON, yyline, yycolumn, yytext()); }
"." { return token(sym.DOT, yyline, yycolumn, yytext()); }
"," { return token(sym.COMMA, yyline, yycolumn, yytext()); }
true { return token(sym.BOOLEAN_LITERAL, yyline, yycolumn, yytext()); }
false { return token(sym.BOOLEAN_LITERAL, yyline, yycolumn, yytext()); }

{Integer} {return token(sym.INTEGER_LITERAL, yyline, yycolumn, yytext()); }
{Float} { return token(sym.FLOATING_POINT_LITERAL, yyline, yycolumn, yytext()); }
{StringLit} { return token(sym.STRING_LITERAL, yyline, yycolumn, yytext()); }

/* Comentarios o espacios */
{Comentario} { /* ignore */ }
{EspacioEnBlanco} { /* ignore */ }

{Ident} { return token(sym.IDENTIFIER, yyline, yycolumn, yytext()); }

. { return token(sym.ERROR, yyline, yycolumn, yytext()); }
