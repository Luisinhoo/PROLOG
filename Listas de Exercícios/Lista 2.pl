%Lista 2:
%Nome: Luís Henrique Gonçalves de Oliveira 

/*
    1 - Defina uma função recursiva para calcular o máximo divisor comum de dois
        números inteiros não negativos a e b, usando o algoritmo deEuclides:
        mdc(a,b) = a, se b = 0,
        mdc(a,b) = mdc(b,a mod b), se b > 0,
        mdc(a,b) = mdc(a,-b), se b < 0
*/
%mdc(a,b) = a, se b = 0
mdc(A, 0, A). %CASO BASE:

%mdc(a,b) = mdc(b, a mod b), se b > 0
mdc(A, B, R) :- %CASO RECURSIVO: 
    B > 0,
    Mod is A mod B,
    mdc(B, Mod, R).%Chamada recursiva com (B, Resto)

/*
    2 -  Defina uma função com recursividade de cauda para calcular o n-ésimo
         (n>=0) número de Fibonacci.
*/
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

/*
    3 -  Defina dois predicados par(Lista) e impar(Lista) de modo que eles são
         verdadeiros se seus argumento são, respectivamente, listas de tamanho par
         e ímpar.
*/
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

/*
    4 - Defina uma relação binária lshift entre listas de modo que o resultado seja
        a própria lista deslocada de 2 elementos. Exemplo:
            ?- lshift([a,b,c,d],L)
            L = [d,a,b,c]. 
*/
lshift_2([A, B | Resto], L_final) :-
    %Extrair os dois primeiros elementos e o resto
    %[A, B | Resto] unifica [a, b | [c, d]] (A=a, B=b, Resto=[c,d])

    %Separar a parte a ser movida (Head) e a parte que fica (Tail)
    Head = [A, B],      % Head = [a, b]
    Tail = Resto,       % Tail = [c, d]

    %Juntar o Resto com os Elementos Deslocados (Tail + Head)
    %A lista final é formada pela junção do Tail com o Head.
    append(Tail, Head, L_final).

/*
    5 - Defina a relação “inverso”, que dada uma lista L1 retorna a lista L1 com os
        seus elementos invertidos. Exemplo:
            ?-inverso([1,2,3,4],L)
            L=[4,3,2,1]). 
*/
% CASO BASE: A lista vazia [] invertida é a própria lista vazia.
inverso([], []).

%CASO RECURSIVO:
inverso([Cabeça | Cauda], ListaInvertida) :-
    %Chama a recursão para inverter a Cauda
    inverso(Cauda, CaudaInvertida),
    append(CaudaInvertida, [Cabeça], ListaInvertida).

/*
    6 - Defina o predicado palíndromo. Uma lista é um palíndromo se ela é lida da
        mesma forma da esquerda para direita e vice-versa. Exemplo:
            ?-palindromo([m,a,d,a,m])
            true. 
*/
%palindromo(L) - É verdadeiro se L for igual à sua inversa.
palindromo(L) :-
    %Calcula a inversa de L, armazenando o resultado em LI.
    inverso(L, LI),
    
    %Verifica se L (Original) é idêntica a LI (Invertida).
    L = LI.

/*
    7 - Escreva um programa Prolog que dados dois inteiros A e B e uma lista de
        inteiros Li, retornará uma lista Lf com todos os inteiros X tais que X está na
        lista Li e X ≥ A e X ≤ B. 
*/
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

/*
    8 - Escreva um programa Prolog para inserir um dado número em uma lista
        ordenada (crescente). Utilize um predicado com três argumentos: o
        primeiro é o número a ser inserido, o segundo a lista ordenada e o terceiro a
        nova lista obtida. 
*/
%CASO BASE: Inserção na Lista Vazia. Se a lista de entrada (Li) está vazia, o número X é o único elemento da nova lista (Lf).
inserir_ordenado(X, [], [X]).

%CASO RECURSIVO 1: Onde a Inserção Ocorre (X é menor ou igual à Cabeça). Se o número X for menor ou igual à Cabeça (H) da lista, X deve vir antes de H.
inserir_ordenado(X, [H | T], [X, H | T]) :-
    X =< H.
%CASO RECURSIVO 2: Continua a Busca (X é maior que a Cabeça)
inserir_ordenado(X, [H | T], [H | Lf]) :-
    X > H,
    inserir_ordenado(X, T, Lf).

