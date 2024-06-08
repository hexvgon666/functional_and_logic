%Объединение двух списков:
append([], L, L).
append([H|T], L, [H|R]) :- append(T, L, R).

reverse([], []).
reverse([H|T], R) :- reverse(T, RT), append(RT, [H], R).

nth0(0, [H|_], H).
nth0(N, [_|T], R) :- N > 0, N1 is N-1, nth0(N1, T, R).

atom_length([],Length).
%перестановки
permutation([], []).
permutation([H|T], P) :-
    permutation(T, TP),
    insert(H, TP, P).

insert(X, L, [X|L]).
insert(X, [H|T], [H|P]) :-
    insert(X, T, P).
%сочетания
combination(_, 0, []).
combination([H|T], N, [H|C]) :-
    N > 0,
    N1 is N - 1,
    combination(T, N1, C).
combination([_|T], N, C) :-
    N > 0,
    combination(T, N, C).

%размещения рекурсия вниз
arrangements([], _, []).
arrangements(L, 0, []).
arrangements(L, N, [H|T]) :-
    N > 0,
    length(L, Len),
    between(1, Len, Index),
    nth1(Index, L, H),
    N1 is N - 1,
    arrangements(L, N1, T).

%рюкзак мин вес
%сумма V=V рюкзака
%сумма объектов=V рюкзака + сумма весов мин)
subset([], 0, []).
subset([[Vol, _]|T], V, [[Vol, _]|Res]) :-
    V >= Vol,
    subset(T, V-Vol, Res).
subset([[Vol, _]|T], V, Res) :-
    V < Vol,
    subset(T, V, Res).

sum_weights([], 0).
sum_weights([[[_, W]|_]|T], Weight) :-
    sum_weights(T, WeightT),
    Weight is W + WeightT.

min_weight_subset(Items, TargetVolume, SelectedItems) :-
    subset(Items, TargetVolume, SelectedItems),
    sum_weights(SelectedItems, MinWeight),
    \+ (subset(Items, TargetVolume, OtherItems), sum_weights(OtherItems, OtherWeight), OtherWeight < MinWeight).


