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
EspacioEnBlanco = {TerminadorDeLinea} | [ \t\f]
ComentarioTradicional = "/" [^] ~"/" | "/" "*"+ "/"
FinDeLineaComentario = "//" {EntradaDeCaracter}* {TerminadorDeLinea}?
ContenidoComentario = ( [^] | \+ [^/] )
ComentarioDeDocumentacion = "/*" {ContenidoComentario} ""+ "/"
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
/* Comentarios */
Comentario = {ComentarioTradicional} | {FinDeLineaComentario} | {ComentarioDeDocumentacion}

/* Identificadores */
Letra = [A-Za-zÑñ_ÁÉÍÓÚáéíóúÜü]
Digito = [0-9]
Identificador = {Letra}({Letra}|{Digito})*

/* Números */
Numero = 0 | [1-9][0-9]*
%%

/* Comentarios o espacios */
{Comentario}|{EspacioEnBlanco} { }

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
class { return token(sym.CLASS, yyline, yycolumn, yytext()); }

this { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
static { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
new { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
enum { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
assert { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
native { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
void { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
strictfp { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
interface { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
implements { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
abstract { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
extends { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
super { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
catch { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
finally { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
throw { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
throws { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
try { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
synchronized { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
volatile { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
transient { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
null { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
Scanner { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
System { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
java { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
util { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
main { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
args { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
out { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
in { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
println { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }
nextInt { return token(sym.RESERVADA, yyline, yycolumn, yytext()); }

private { return token(sym.PRIVATE, yyline, yycolumn, yytext()); }
public { return token(sym.PUBLIC, yyline, yycolumn, yytext()); }
protected { return token(sym.PROTECTED, yyline, yycolumn, yytext()); }
package { return token(sym.PACKAGE, yyline, yycolumn, yytext()); }
import { return token(sym.IMPORT, yyline, yycolumn, yytext()); }

"++" { return token(sym.INCREMENTO, yyline, yycolumn, yytext()); }
"--" { return token(sym.DECREMENTO, yyline, yycolumn, yytext()); }
"&&" { return token(sym.ANDLOGICO, yyline, yycolumn, yytext()); }
"||" { return token(sym.ORLOGICO, yyline, yycolumn, yytext()); }
"!" { return token(sym.NEGACION, yyline, yycolumn, yytext()); }
\+ { return token(sym.SUMA, yyline, yycolumn, yytext()); }
"-" { return token(sym.RESTA, yyline, yycolumn, yytext()); }
"*" { return token(sym.MULTIPLICACION, yyline, yycolumn, yytext()); }
"/" { return token(sym.DIAGONAL, yyline, yycolumn, yytext()); }
"%" { return token(sym.MODULO, yyline, yycolumn, yytext()); }

"==" { return token(sym.IGUAL, yyline, yycolumn, yytext()); }
">=" { return token(sym.MAYORIGUAL, yyline, yycolumn, yytext()); }
"<=" { return token(sym.MENORIGUAL, yyline, yycolumn, yytext()); }
">" { return token(sym.MAYORQUE, yyline, yycolumn, yytext()); }
"<" { return token(sym.MENORQUE, yyline, yycolumn, yytext()); }
"!=" { return token(sym.DIFERENTEDE, yyline, yycolumn, yytext()); }

\" { return token(sym.COMILLAS, yyline, yycolumn, yytext()); }
"?:" { return token(sym.INTERROGACION, yyline, yycolumn, yytext()); }
"~" { return token(sym.VIRGUILLA, yyline, yycolumn, yytext()); }
"<<" { return token(sym.DOBLEMAYORQUE, yyline, yycolumn, yytext()); }
">>" { return token(sym.DOBLEMENORQUE, yyline, yycolumn, yytext()); }
">>>" { return token(sym.TRIPLEMENORQUE, yyline, yycolumn, yytext()); }
"|" { return token(sym.OR, yyline, yycolumn, yytext()); }
"&" { return token(sym.AND, yyline, yycolumn, yytext()); }
"^" { return token(sym.EXPONENTE, yyline, yycolumn, yytext()); }
"=" { return token(sym.ASIGNACION, yyline, yycolumn, yytext()); }
"+=" { return token(sym.MASIGUAL, yyline, yycolumn, yytext()); }
"-=" { return token(sym.MENOSIGUAL, yyline, yycolumn, yytext()); }
"*=" { return token(sym.PORIGUAL, yyline, yycolumn, yytext()); }
"/=" { return token(sym.DIVISIONIGUAL, yyline, yycolumn, yytext()); }
"%=" { return token(sym.MODULOIGUAL, yyline, yycolumn, yytext()); }
"~=" { return token(sym.NOTIGUAL, yyline, yycolumn, yytext()); }
"|=" { return token(sym.ORIGUAL, yyline, yycolumn, yytext()); }
"&=" { return token(sym.ANDIGUAL, yyline, yycolumn, yytext()); }
"^=" { return token(sym.ASIGNACIONOREXCLUSIVO, yyline, yycolumn, yytext()); }
"<<=" { return token(sym.DOBLEMAYORQUEIGUAL, yyline, yycolumn, yytext()); }
">>=" { return token(sym.DOBLEMENORQUEIGUAL, yyline, yycolumn, yytext()); }

"(" { return token(sym.PARENTESISIZQ, yyline, yycolumn, yytext()); }
")" { return token(sym.PARENTESISDER, yyline, yycolumn, yytext()); }
"{" { return token(sym.LLAVEIZQ, yyline, yycolumn, yytext()); }
"}" { return token(sym.LLAVEDER, yyline, yycolumn, yytext()); }
"[" { return token(sym.CORCHETEIZQ, yyline, yycolumn, yytext()); }
"]" { return token(sym.CORCHETEDER,  yyline, yycolumn, yytext()); }
";" { return token(sym.PUNTOYCOMA, yyline, yycolumn, yytext()); }
":" { return token(sym.DOSPUNTOS, yyline, yycolumn, yytext()); }
"." { return token(sym.PUNTO, yyline, yycolumn, yytext()); }
"," { return token(sym.COMA, yyline, yycolumn, yytext()); }
true { return token(sym.VERDADERO, yyline, yycolumn, yytext()); }
false { return token(sym.FALSO, yyline, yycolumn, yytext()); }
{Integer} {return token(sym.ENTERO, yyline, yycolumn, yytext()); }
{Float} { return token(sym.FLOTANTE, yyline, yycolumn, yytext()); }

{Ident} { return token(sym.IDENTIFICADOR, yyline, yycolumn, yytext()); }

. { return token(sym.ERROR, yyline, yycolumn, yytext()); }