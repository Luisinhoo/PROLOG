% Nome: Luís Henrique Gonçalves de Oliveira

/*
1 - Aritmética - Exemplos
 ?- X = 1+2.
 X = 1+2
 
 ?- X is 1+2.
 X = 3
 
 ?- X is 3/2, Y is 3 // 2.
 X = 1.5
 Y = 1
 
 ?- 277 * 37 > 10000.
 true
 
 ?- 1+2 = 2+1.
 false
 
 ?- 1+2 =:= 2+1.
 true
 
 ?- 1+A = B+2.
 A=2
 B=1
*/

%2 - Alguns exercícios para serem resolvidos no laboratório:
concatena([],L,L).
concatena([X|R],L,[X|C]) :-
    concatena(R,L,C).
%Consulta: ?- 'concatena([1, 2], [3, 4], L).' (Este predicado serve para grudar uma lista no final da outra)

adiciona(X,L,[X|L]).
%Consulta: ?- 'adiciona(zero, [1, 2, 3], L).' (Para colocar um "intruso" bem no começo da lista)

tira(_,[],[]).
tira(X,[X|R],R).
tira(X,[Y|R],[Y|R1]) :-
    tira(X,R,R1).
%Consulta: ?- 'tira(b, [a, b, c], L).'(Para procurar um elemento e removê-lo da lista)

adiciona_fim(X,L,NL) :-
    concatena(L,[X],NL).
%Consulta: ?- 'adiciona_fim(4, [1, 2, 3], L).' (Diferente do adiciona comum, este coloca o elemento lá no final da fila)

/*
3 - Mais Exercícios:
    Implemente os predicados tira_todos/3, pertence/2, ultimo/2, sublista/2, permutacao/2 e
    ordena/2 (fazer uma versão para ordenar uma lista de números por ordem crescente, e uma
    outra para ordenar por ordem decrescente).
		Lembre-se:
            -> Se nos argumentos das operações de comparação ou no argumento direito de is
            aparecerem variáveis, elas têm de estar instanciadas com números no momento de
            cálculo.
            -> Um programa pode estar declarativamente correto, mas procedimentalmente
            incorreto (poderá ser necessário reordenar as cláusulas do programa).
*/
%PERTENCE: Verifica se um elemento X está dentro da lista.
%Caso Base: O elemento é a própria cabeça da lista. Sucesso imediato!
pertence(X, [X|_]). 

%Caso Recursivo: Se não for a cabeça, ignora ela (_) e procura na cauda (R).
pertence(X, [_|R]) :-
    pertence(X, R).

%Consulta: ?- 'pertence(2, [1, 2, 3]).'

%ULTIMO: Descobre qual é o último elemento da lista.
%Caso Base: Se a lista tem apenas UM elemento [X], então ele é o último.
ultimo(X, [X]).

%Caso Recursivo: Se tem mais de um, ignora a cabeça e foca na cauda.
ultimo(X, [_|R]) :-
    ultimo(X, R).

%Consulta: ?- 'ultimo(X, [a, b, c]).' 

%TIRA_TODOS: Remove todas as vezes que o X aparecer.
%Caso Base: Se a lista estiver vazia, o resultado é vazio.
tira_todos(_, [], []).

%Se a cabeça da lista for IGUAL ao X, a gente joga ela fora e continua.
tira_todos(X, [X|R], R1) :- 
    tira_todos(X, R, R1).

% Se a cabeça (Y) for DIFERENTE de X, a gente guarda o Y no resultado.
tira_todos(X, [Y|R], [Y|R1]) :- 
    X \= Y, tira_todos(X, R, R1).

%Consulta: ?- 'tira_todos(a, [a, b, a, c], L).'

%SUBLISTA: Verifica se uma lista S faz parte de uma lista maior L.
%Usamos o 'concatena' que você já tem[cite: 7]. 
%S é sublista se L pode ser dividida em: [Algo antes] + [S] + [Algo depois].
sublista(S, L) :- 
    concatena(_, L2, L),    %Pega um pedaço L2 da lista L
    concatena(S, _, L2).    %Vê se S é o começo desse pedaço L2

%Consulta: ?- 'sublista([b, c], [a, b, c, d]).'

%PERMUTACAO: Mostra todas as ordens possíveis da lista.
permutacao([], []).
%Ele tira um elemento X da lista, permuta o resto (R1) e depois junta tudo.
permutacao(L, [X|P]) :-
    tira(X, L, R1),        %Usa o 'tira' do exercício anterior [cite: 31]
    permutacao(R1, P).

%Consulta: ?- 'permutacao([1, 2], L).'

%ORDENA (Crescente e Decrescente)
%Estou usando o método 'Insertion Sort' (mais fácil de entender, na minha opinião).

%VERSÃO CRESCENTE
ordena_crescente([], []).
ordena_crescente([X|R], L) :- 
    ordena_crescente(R, R1), 
    insere_crescente(X, R1, L).

insere_crescente(X, [], [X]).
%Regra: O X vem antes de Y se for menor ou igual.
insere_crescente(X, [Y|R], [X, Y|R]) :-
    X =< Y. 
insere_crescente(X, [Y|R], [Y|R1]) :- 
    X > Y, insere_crescente(X, R, R1).

%VERSÃO DECRESCENTE
ordena_decrescente([], []).
ordena_decrescente([X|R], L) :- 
    ordena_decrescente(R, R1), 
    insere_decrescente(X, R1, L).

insere_decrescente(X, [], [X]).
%Regra: O X vem antes de Y se for maior ou igual
insere_decrescente(X, [Y|R], [X, Y|R]) :- X >= Y. 
insere_decrescente(X, [Y|R], [Y|R1]) :- X < Y, insere_decrescente(X, R, R1).

/* 
Consultas: 
	?- 'ordena_crescente([3, 1, 2], L).'   
Resultado:  L = [1, 2, 3].

	?- 'ordena_decrescente([3, 1, 2], L).' 
Resultado L = [3, 2, 1].
*/