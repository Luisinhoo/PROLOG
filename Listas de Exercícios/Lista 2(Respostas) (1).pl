
%Nome: Luís Henrique Gonçalves de Oliveira - Nº12121BCC022

/*
1-
%mdc(a,b) = a, se b = 0
mdc(A, 0, A). %CASO BASE:

%mdc(a,b) = mdc(b, a mod b), se b > 0
mdc(A, B, R) :- %CASO RECURSIVO: 
    B > 0,
    Mod is A mod B,
    mdc(B, Mod, R).%Chamada recursiva com (B, Resto)
*/

/*
%2-
fibonacci(N, R) :-
    %CASO ESPECIAL (N=0): É tratado separadamente para simplicidade.
    (N = 0 -> R = 0 ; fib_cauda(N, 0, 1, R)).

%CASO BASE (N=1): Quando o contador chega a 1, o resultado é o F_atual (o N-ésimo número).
fib_cauda(1, _, F_atual, F_atual).

%CASO RECURSIVO (N > 1)
fib_cauda(N, F_anterior, F_atual, R) :-
    N > 1,
    N_proximo is N - 1,
    Novo_F_atual is F_anterior + F_atual,
    fib_cauda(N_proximo, F_atual, Novo_F_atual, R).
*/

/*
%3-
%CASO BASE: A lista vazia [] tem tamanho 0, que é par.
par([]).

%CASO RECURSIVO: Se removermos 2 elementos de uma lista e o resto (Cauda) ainda for par, então a lista original também é par.
par([_, _ | Cauda]) :-
    par(Cauda).

%CASO BASE: Uma lista com 1 elemento [_] tem tamanho 1, que é ímpar.
impar([_]).

%CASO RECURSIVO: Se removermos 2 elementos de uma lista e o resto (Cauda) ainda for ímpar, então a lista original também é ímpar.
impar([_, _ | Cauda]) :-
    impar(Cauda).
*/

/*
%4-
lshift_2([A, B | Resto], L_final) :-
    %Extrair os dois primeiros elementos e o resto
    %[A, B | Resto] unifica [a, b | [c, d]] (A=a, B=b, Resto=[c,d])

    %Separar a parte a ser movida (Head) e a parte que fica (Tail)
    Head = [A, B],      % Head = [a, b]
    Tail = Resto,       % Tail = [c, d]

    %Juntar o Resto com os Elementos Deslocados (Tail + Head)
    %A lista final é formada pela junção do Tail com o Head.
    append(Tail, Head, L_final).
*/

/*
%5-
% CASO BASE: A lista vazia [] invertida é a própria lista vazia.
inverso([], []).

%CASO RECURSIVO:
inverso([Cabeça | Cauda], ListaInvertida) :-
    %Chama a recursão para inverter a Cauda
    inverso(Cauda, CaudaInvertida),
    append(CaudaInvertida, [Cabeça], ListaInvertida).
*/

/*
%6-
%palindromo(L) - É verdadeiro se L for igual à sua inversa.
palindromo(L) :-
    %Calcula a inversa de L, armazenando o resultado em LI.
    inverso(L, LI),
    
    %Verifica se L (Original) é idêntica a LI (Invertida).
    L = LI.
*/

/*
%7-
%CASO BASE: Quando a lista de entrada Li está vazia, o resultado Lf também é vazio.
filtrar_intervalo(_, _, [], []).

%CASO RECURSIVO (Aceita o elemento): Se X satisfaz a condição (X >= A e X =< B).
filtrar_intervalo(A, B, [X | CaudaLi], [X | CaudaLf]) :-
    X >= A,
    X =< B,
    filtrar_intervalo(A, B, CaudaLi, CaudaLf).

%CASO RECURSIVO (Rejeita o elemento): Se X não satisfaz a condição.
filtrar_intervalo(A, B, [X | CaudaLi], Lf) :-
    filtrar_intervalo(A, B, CaudaLi, Lf).
*/

/*
%8-
%CASO BASE: Inserção na Lista Vazia. Se a lista de entrada (Li) está vazia, o número X é o único elemento da nova lista (Lf).
inserir_ordenado(X, [], [X]).

%CASO RECURSIVO 1: Onde a Inserção Ocorre (X é menor ou igual à Cabeça). Se o número X for menor ou igual à Cabeça (H) da lista, X deve vir antes de H.
inserir_ordenado(X, [H | T], [X, H | T]) :-
    X =< H.
%CASO RECURSIVO 2: Continua a Busca (X é maior que a Cabeça)
inserir_ordenado(X, [H | T], [H | Lf]) :-
    X > H,
    inserir_ordenado(X, T, Lf).
*/