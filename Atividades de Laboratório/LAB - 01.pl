Nome: Luís Henrique Gonçalves de Oliveira

%Fatos
telefone(maria, 123).
telefone(joaquim, 234).
telefone(marco, 345).
telefone(pedro, 456).
telefone(ana, 567).
telefone(juliana, 678).

%Quem saiu, Quem recebeu a visita
visita(juliana, maria).
visita(ana, joaquim). 
visita(marco, juliana).
visita(pedro, juliana).
/*
	Consulta: 'visita(X, Y).' (Quem está visitando quem?)
*/

%Quem está realmente sentado no sofá de casa
emCasa(joaquim).
emCasa(maria).

%REGRAS
%Sabendo que uma pessoa P está acompanhada se tem visitas, acrescente à Base de Conhecimento o predicado acompanhada/1.
acompanhada(P) :- 
    visita(_, P). %O "_" significa "não importa quem", desde que alguém apareça.
/*
	Consulta: 'acompanhada(P).' (Quem está acompanhando?) 
*/

%Acrescente à base de conhecimento o predicado inconsistente/0 que determina se, na base de conhecimento, existe alguém que está simultaneamente em casa e visitando alguém.
inconsistente :- 
    emCasa(X),     %X está em casa?
    visita(X, _).  %E esse mesmo X está visitando alguém? Se sim, é erro!
/*
	Consulta: 'inconsistente.' (Queremos saber se tem alguém "mentindo" que está em casa, 
    		   mas na verdade está visitando outra pessoa.)
*/

%Supondo que quando alguém sai para fazer uma visita leva consigo todos os que o estão visitando, acrescente à Base de Conhecimento o predicado em_casa_de/2 que lhe permite determinar se
%uma pessoa está em casa de outra.
%Caso Base: X está na casa de Y se X visita Y.
em_casa_de(X, Y) :- 
    visita(X, Y).
% Caso Recursivo: X está na casa de Y se X visita Z e esse Z está na casa de Y.
em_casa_de(X, Y) :- 
    visita(X, Z), 
    em_casa_de(Z, Y).

/*
	Consulta: 'em_casa_de(marco, maria).' (Onde o Marco está?)
*/

%Se a pessoa está em casa, o telefone é o dela.
em_casa_de(X, Y) :- 
    visita(X, Y).
em_casa_de(X, Y) :- 
    visita(X, Z), em_casa_de(Z, Y).

%Depois coloque o contato
contato(P, T) :- 
    emCasa(P), 
    telefone(P, T).

contato(P, T) :- 
    em_casa_de(P, A), %O erro acontece aqui se a regra acima não existir!
    emCasa(A), 
    telefone(A, T).
/*
	Consulta: 'em_casa_de(marco, T).'(Como eu falo com o Marco?)
*/

%Sabendo que três ou mais pessoas numa casa implica na realização de uma festa, escreva um predicado festeiro/1 que determina se uma pessoa está dando uma festa.
festeiro(Dono) :-
    emCasa(Dono),           %O dono tem que estar lá.
    em_casa_de(V1, Dono),   %Primeira visita (V1).
    em_casa_de(V2, Dono),   %Segunda visita (V2).
    V1 \= V2.               %V1 e V2 não podem ser a mesma pessoa!
/*
	Consulta: 'festeiro(X).'(Quem está dando festa?)
*/
