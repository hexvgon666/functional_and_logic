man(vova).
man(vitya).
man(vitya2).
man(vitya3).
woman(nina).
woman(lena).
parent(vova,nina).
parent(vova,vitya).
parent(vova,vitya2).
men():- man(X),print(X),nl,fail.
women():- woman(X),print(X),nl,fail.
children(X):- parent(X,Y),print(Y),nl,fail.
mother(X,Y):-woman(X),parent(X,Y).
father(X,Y):-man(X),parent(X,Y).
brother(X,Y):-man(X),parent(Z,X),parent(Z,Y).
max(X,Y,X):- X>Y,!.
max(_,Y,Y).

fact(0,1).
fact(N,X):- N>0,
    N1 is  N-1,
    fact(N1,X1),
    X is X1*N.

fact2(0,X,X).
fact2(N,A,X):- N>0,
    N1 is N-1,
    A1 is A*N,
    fact2(N1,A1,X1),
    X is X1.
call_fact2(N,X):-fact2(N,1,X).

%chain(+N,-L)
chain(N,L) :- chain(N,0,L).
chain(1,L,L):-!.
chain(N,CurL,L) :- 0 is N mod 2,!, NewN is N div 2,
    NewL is CurL + 1, chain(NewN,NewL,L).
chain(N,CurL,L) :- NewN is 3*N + 1, NewL is CurL + 1,
    chain(NewN,NewL,L).

maxChain(NMaxChain) :- maxChain(1,0,1,NMaxChain).
maxChain(1000000,_,NMaxChain,NMaxChain) :- !.
maxChain(N,CurChain,_,NMaxChain) :- chain(N,L),
    L > CurChain, !, NewN is N + 1, maxChain(NewN,L,N,NMaxChain).
maxChain(N,CurChain,CurN,NMaxChain) :- NewN is N + 1,
    maxChain(NewN,CurChain,CurN,NMaxChain).

%read_list(+N,-List)
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).

write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

concat1([],List,List).
concat1([H|T],List,[H|Tail]) :- concat(T,List,Tail).

sum_list_down(List,Sum) :- sum_list_down(List,0,Sum).
sum_list_down([],CurSum,CurSum):-!.
sum_list_down([H|T],CurSum,Sum) :- NewSum is CurSum + H,
    sum_list_down(T,NewSum,Sum).

sum_list_up([],0):-!.
sum_list_up([H|T],Sum) :- sum_list_up(T,SumTail), Sum is SumTail + H.


list_el_numb(List,El,Numb) :- list_el_numb(List,El,Numb,1).
list_el_numb([],_,_,_) :- !,fail.
list_el_numb([El|_],El,Numb,Numb).
list_el_numb([_|T],El,Numb,Ind) :- NewInd is Ind + 1,
    list_el_numb(T,El,Numb,NewInd).


list :- list_el_numb([5,6,7],El,N), write(El),write(' '),write(N),nl,fail.


%Задание 2
%Найти произведение цифр числа.
%Найти максимальную цифры числа, не делящуюся на 3
%Найти количество делителей числа
%max_of_num(+X,-O)
max_of_num(0,O,O):-!.
max_of_num(X,O):- max_of_num(X,0,O).
max_of_num(X,F,O):- X1 is X mod 10,(X1 >= F -> F1 = X1, X2 is X div 10; X2 is X div 10, F1 = F),max_of_num(X2,F1,O).

min_odd(0,O,O):-!.
min_odd(X,O):- min_odd(X,9,O).
min_odd(X,F,O):- X1 is X mod 10,( X1 < F, 1 is X1 mod 2 -> F1 = X1, X2 is X div 10; X2 is X div 10, F1 = F),min_odd(X2,F1,O).

nod(0,F,O):-!.
nod(X,0,O):-!.
nod(X,F,O):- (X > 0, F > 0 -> (X > F -> X1 is X mod F, F1 = F; F1 is F mod X, X1 = X)),(X1 = 0 ->O = F; X1 = X1,F1 = F1),(F1 = 0 -> O = X; F1 = F1 , X1 = X1), nod(X1,F1,O).

%Задание 3

%11 Дан целочисленный массив, в котором лишь один элемент отличается от
%остальных. Необходимо найти значение этого элемента.
%diff(+[X],-E).
diff([X], X):-!.
diff([], E):-!.
diff([Y, X, X2 | T], Y):- Y \= X, X = X2,!,E is Y.

diff([X, X | T], E) :-
   diff([X | T], E).

diff([X, Y | T], E) :-
                X \= Y,!,
                E is Y.
% 14 Дан целочисленный массив и интервал a..b. Необходимо найти
% количество элементов в этом интервале.

%kol(+[X],-Sum).
kol([],Sum,Sum):-!.
kol([Head|Tail],Sum):- kol([Head|Tail],Sum,0).
kol([Head|Tail],Sum,K):- K1 is K + 1, kol(Tail,Sum,K1).

% 25 Дан целочисленный массив и интервал a..b. Необходимо найти
% максимальный из элементов в этом интервале.

%max_el(+[X],-Max_e).
max_el([Max_e],Max_e):-!.
max_el([Head|Tail],Max_e):- max_el(Tail,Max_e2), Max_e2 > Head -> Max_e = Max_e2; Max_e = Head.
%Задание 4
%Воронов, Павлов, Левицкий и Сахаров – четыре талантливых
% молодых человека. Один из них танцор, другой художник, третий-певец, а
% четвертый-
% писатель. О них известно следующее: Воронов и Левицкий сидели в зале
% консерватории в
% тот вечер, когда певец дебютировал в сольном концерте. Павлов и
% писатель вместе
% позировали художнику. Писатель написал биографическую повесть о
% Сахарове и
% собирается написать о Воронове. Воронов никогда не слышал о Левицком.
% Кто чем занимается?

list([H|_],H).
list([_|T],H):-list(T,H).

main:-People=[_,_,_,_],
    list(People,[voronov,_,_,true]),
    list(People,[pavlov,_,_,_]),
    list(People,[levisci,4,_,true]),
    list(People,[saxarov,_,_,_]),


    list(People,[WHY1,3,poz,false]),
    list(People,[WHY2,_,pell,false]),
    list(People,[WHY3,_,sidel,_]),
    list(People,[WHY4,4,sid,_]),


    write('РџРµР» - '),write(WHY2),nl,
    write('РџРѕР·РёСЂРѕРІР°Р» - '),write(WHY1),nl,
    write('РЎРёРґРµР» - '),write(WHY4),nl,
    write('РЎРёРґРµР» - '),write(WHY3).
%Задание 5
%Найти количество делителей числа, не делящихся на 3
%Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не
%взаимно простых с произведением цифр числа.
%del(+F,-O)
del(F,O):-del(F,O,0,1,0).
del(F,O,Sum,Q,0):- (F =< Q -> RR2 = 1; RR2 = 0), T is F mod Q, J is Q mod 3,(T == 0, J > 0 -> Sum2 is Sum + Q, Q2 is Q + 1; Sum2 is Sum, Q2 is Q + 1), del(F,O,Sum2,Q2,RR2).
del(F,Sum,Sum,Q,1):- !.

%Задание 6
%Пентагональные числа генерируются по формуле
%P (n)= n (3 n −1) / 2 Первые десять пятиугольных чисел:
%1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
%Видно, что P(4) + P(7) = 22 + 70 = 92 = P 8 . Однако их различие 70 - 22 = 48 не является
%пятиугольным. Найдите пару пятиугольных чисел P j и P k , меньших числа 1000000 для
%которых их сумма и разность пятиугольны и D = | P k - P j | сведено к минимуму; какова
%стоимость D?
%Задача должна быть решена без использования списков.

pentagonal(N, P) :-
    P is (N * (3 * N - 1)) // 2.

is_pentagonal(X) :-
    integer(X),
    N is ceiling((-1 + sqrt(1 + 24 * X)) / 6),
    X =:= (N * (3 * N - 1)) // 2.

find_min_diff(Limit, Pj, Pk, Diff) :-
    Pj #< Pk,
    Pj #< Limit, Pk #< Limit,
    is_pentagonal(Pj), is_pentagonal(Pk),
    is_pentagonal(Pj + Pk), is_pentagonal(Pk - Pj),
    Diff #= Pk - Pj,
    minimize(Diff, 0).

main :-
    Limit is 1000000,
    find_min_diff(Limit, Pj, Pk, Diff),
    format('Минимальная разность между двумя пятиугольными числами, меньшими ~d, равна ~d, где Pj = ~d и Pk = ~d.', [Limit, Diff, Pj, Pk]).
