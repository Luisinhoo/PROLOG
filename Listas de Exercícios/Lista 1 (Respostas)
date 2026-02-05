%Lista 1 de PROLOG
%Nome: Luís Henrique Gonçalves de Oliveira

/*
1 - Pouco se sabe da história passada da família Silva. Existem alguns registros antigos que indicam
que o casal José e Maria criou dois filhos, o João e a Ana. Sabe-se que Ana teve duas filhas, a Helena
e a Joana, segundo os mesmos registros. Além disso, Mário é filho do João. Estranho também, foi
constatar que o Carlos nasceu da relação entre a Helena e Mário.
a) Utilizando o predicado progenitor(X,Y) (ou seja, X é progenitor de Y), represente em Prolog todos
os progenitores da família Silva.
b) Represente em Prolog os relacionamentos: sexo (masculino ou feminino), irmã, irmão,
descendente, mãe, pai, avô, tio, primo.
c) Formule em Prolog as seguintes consultas (ou questões):

1. O João é filho do José?
2. Quem são os filhos da Maria? 
3. Quem são os primos do Mário?
4. Quantos sobrinhos/sobrinhas com um Tio existem na família Silva?
5. Quem são os ascendentes do Carlos? 
6. A Helena tem irmãos? E irmãs?
*/

%a) Utilizando o predicado progenitor(X,Y) (ou seja, X é progenitor de Y), represente em Prolog todos
%os progenitores da família Silva.
%Fatos progenitor
progenitor(jose, joao).
progenitor(jose, ana).
progenitor(maria, joao).
progenitor(maria, ana).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(joao, mario).
progenitor(helena, carlos).
progenitor(mario, carlos).

%b) Represente em Prolog os relacionamentos: sexo (masculino ou feminino), irmã, irmão,
%descendente, mãe, pai, avô, tio, primo.
%Fatos sexo (masculino ou feminino)
sexo(jose, masculino).
sexo(maria, feminino).
sexo(joao, masculino).
sexo(ana, feminino).
sexo(helena, feminino).
sexo(joana, feminino).
sexo(mario, masculino).
sexo(carlos, masculino).

%Regra pai e mãe:
pai(X, Y) :-
    progenitor(X, Y),
    sexo(X, masculino).

mae(X, Y) :-
    progenitor(X, Y),
    sexo(X, feminino).

%Regra irmã e irmão:
irma(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    sexo(X, feminino),
    X \= Y.

irmao(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    sexo(X, masculino),
    X \= Y.

%Regra Descendente:
descendente(X, Y) :-
    progenitor(X, Y).

descendente(X, Y) :-
    progenitor(X, Z),
    descendente(Z, Y).

% Regra Avô:
avo(X, Y) :-
    pai(X, Z),
    progenitor(Z, Y).

%Regra Tio:
tio(X, Y) :-
    progenitor(P, Y),
    irmao(X, P).

%Regra Tia:
tia(X, Y) :-
    progenitor(P, Y),
    irma(X, P).

%Regra Primo:
primo(X, Y) :-
    progenitor(P1, X),
    progenitor(P2, Y),
    P1 \= P2,
    (irmao(P1, P2) ; irma(P1, P2)),
    X \= Y.

%c) Formule em Prolog as seguintes consultas (ou questões):

%1. O João é filho do José?
%-> Consulta: pai(jose, joao).

%2. Quem são os filhos da Maria? 
%-> Consulta: mae(maria, Y).

%3. Quem são os primos do Mário?
%-> Consulta: primo(X, mario).

%4. Quantos sobrinhos/sobrinhas com um Tio existem na família Silva?
%-> Consulta:findall(Y, (tio(_, Y); tia(_, Y)), Lista), list_to_set(Lista, SobrinhosUnicos), length(SobrinhosUnicos, Quantidade).

%5. Quem são os ascendentes do Carlos? 
%Regra Ascendente:
ascendente(X, Y) :-
    progenitor(X, Y).

ascendente(X, Y) :-
    progenitor(Z, Y),
    ascendente(X, Z).
%-> Consulta: ascendente(X, carlos).

%6. A Helena tem irmãos? E irmãs?
%-> Consulta: 
%irmao(X, helena).
%irma(X, helena).

/*
Atividade 2: 

- fórmula a ser provada: p ∧ q

- fatos e regras:
I. p v ¬s
II. s
III. q v ¬t
IV. q v ¬u v ¬v
V. u
VI. v

Para isso, temos que:

1º Passo: Negar a fórmula e depois aplicar a FNC nela.

- p ∧ q

Negação da fórmula: ¬(p ∧ q) ≡ ¬p v ¬q (Pela Lei de Morgan)

2º Passo: Prova por Resolução

Temos que, através da fórmula ¬p v ¬q, que vamos chamar de f1, devemos chegar em cláusula vazia utilizando os fatos e regras.

Utilizando f1 e I: (¬p v ¬q) e (p v ¬s) 
				cancela ¬p e p, temos: (¬q v ¬s)  R1

Utilizando R1 e II: (¬q v ¬s) e s
				cancela ¬s e s. temos ¬q R2

Utilizando R2 e IV: ¬q e (q v ¬u v ¬v)
				cancela ¬q e q, temos: (¬u v ¬v) R3

Utilizando R3 e V: (¬u v ¬v) e u
				cancela ¬u e u, temos: ¬v R4

Utilizando R4 e VI: ¬v e v
				cancela ¬v e v, temos { } Cláusula vazia

-> Atingimos a cláusula vazia { }, logo o conjunto de fatos e a negação da consulta são inconsistentes. Portanto a fórmula p ∧ q  é uma consequência lógica dos fatos e regras. cqd
*/

/*
Atividade 3
a)
- fórmula a ser provada: A

- fatos e regras:
I. a ←  (b ∧ c)
II. b
III. c

Temos que:1º Passo: Converter Fórmulas para Cláusulas e Negar a Prova
A fórmula (F1), a ← (b ∧ c), deve ser convertida para a Forma Normal Conjuntiva (FNC).

- F1 ≡ (b ∧ c) → a
- F1 ≡ ¬(b ∧ c) v a
- F1 ≡ ¬b v ¬c v a  (Pela Lei de De Morgan)

- Negação da fórmula a ser provada: ¬A

- fatos e regras em FNC:
I. a v ¬b v ¬c
II. b
III. c
IV. ¬a (negação da consulta)

2º Passo: Prova por Absurdo.

Temos que, através da fórmula ¬a, devemos chegar em cláusula vazia { } utilizando as cláusulas dos fatos e regras.

Utilizando IV e I: ¬a e (a v ¬b v ¬c)
			cancela ¬a e a, temos: (¬b v ¬c) R1

Utilizando R1 e II: (¬b v ¬c) e b
			cancela ¬b e b, temos: ¬c R2

Utilizando R2 e III: ¬c e c
			cancela ¬c e c, temos: { }
			
Atingimos a cláusula vazia { }, logo o conjunto de fatos e a negação da consulta são inconsistentes. Portanto, a fórmula A é uma consequência lógica dos fatos e regras. cqd
*/

5b)

% prolog_atividade_3.pl

% F1: a ← (b ∧ c)
a :- b, c.

% F2: b
b.

% F3: c
c.

%Atividade 4:
%Fatos
mais_alta_que(bia, maria).
mais_alta_que(maria, juliana).
mais_alta_que(juliana, gina).

%Regra Base:
maior_do_que(PessoaA, PessoaB) :-
    mais_alta_que(PessoaA, PessoaB).

%Regra Recursiva:
maior_do_que(PessoaA, PessoaB) :-
    mais_alta_que(PessoaA, PessoaZ),
    maior_do_que(PessoaZ, PessoaB).

Atividade 5

a)
?- a(X,Y),b(X,Y).
X = 3, Y = 2.
X = 4, Y = 4.
b)
?- a(X,Y), b(X,Y), a(Y,Y).
X = 4, Y = 4.

Atividade 6

?- r(X,Y),s(Y,Z), not(r(Y,X)), not(s(Y,Y)).

a)
X = a, Y = d, Z = a.
b)
O Prolog retrocede 2 vezes do terceiro para o segundo predicado antes de obter a primeira resposta (X = a, Y = d,  Z = a).
