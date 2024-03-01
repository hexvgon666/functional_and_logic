man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

% men
men:- man(X), write(X), nl, fail.

% women
women:- woman(X), write(X), nl, fail.

% children(+X) вывести всех детей X
children(X):-  parent(X, Y), write(Y), nl, fail.

% mother(+X, +Y) является ли X матерью Y
mother(X, Y):- woman(X), parent(X, Y).

% brother(?X, +Y) является ли X братом Y
brother(X, Y):- man(X), parent(Z, X), parent(Z, Y), man(Z), X \= Y.

% brothers(+X) вывести всех братьев X
brothers(X):- brother(Y, X), write(Y), nl, fail.

% b_s(?X, +Y) является ли X братом или сестрой Y 
b_s(X, Y):- brother(X, Y).
b_s(X, Y):- sister(X, Y).

% b_s(+X)
b_s(X):- b_s(Y, X), write(Y), nl, fail.

% daughter(?X, +Y) - является ли X дочкой Y
daughter(X, Y):- woman(X), parent(Y, X).

% daughter(+X) - вывести всех дочек X
daughter(X):- daughter(Y, X), write(Y), nl, fail.

% wife(?X, +Y) - является ли X женой Y
wife(X, Y):- woman(X), parent(X, Z), parent(Y, Z), X \= Y.

% wife(+X) - вывести жену X
wife(X):- wife(Y, X), write(Y).
