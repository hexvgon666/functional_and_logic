movie :-
    retractall(asked(_,_)),
    genre(Films),
    !,
    nl,
    write('You wished for a movie '), write(Films), write(.), nl.
movie :-
    nl,
    write('We could not guess the movie'), nl.

%1

films(red) :-
    desc('main character in a red suit').

films(katana) :-
    desc('the main character has a katana').

films(ryan) :-
    desc('the actor playing the main character is Ryan Reynolds').

films(action) :-
    desc('one of the genres of this film is action').

%2

films(super) :-
    desc('There are super powers in this movie').

films(worlds) :-
    desc('there are other worlds in this movie').

films(jodie) :-
    desc('one of the main characters is Jodie Comer').

films(melodrama) :-
    desc('one of the genres of this film is melodrama').

%3

films(alaska) :-
    desc('takes place in Alaska').

films(house) :-
    desc('the main character works in a book publishing house').

films(sandra) :-
    desc('one of the main characters is Sandra Bullock').

films(married) :-
    desc('the main character is going to get married').

%4

films(job) :-
    desc('The main character has a dangerous job').

films(comedy) :-
    desc('one of the genres of this film is comedy').

films(person) :-
    desc('the main character protects a person').

films(samuel) :-
    desc('the actor playing the main character is Samuel').

%5

films(trouble) :-
    desc('the main character gets into trouble').

films(friends) :-
    desc('the film shows the company of friends').

films(phillip) :-
    desc('the actor playing the main character is Phillip Lachaud').

%6

films(law) :-
    desc('the main character broke the law').

films(school) :-
    desc('the main character works at school').

films(treasure) :-
    desc('the main character is looking for treasure').

films(barek) :-
    desc('the actor playing the main character is Elias M,Barek').



genre(deadpool) :-
    films(super),
    films(katana),
    films(red),
    films(action),
    
    films(trouble),
    films(job),
    films(ryan),
    films(law).

genre(main_character) :-
    films(super),
    films(worlds),
    films(jodie),
    films(melodrama),

    films(action),
    films(trouble),
    films(ryan),
    films(jodie).

genre(offer) :- 
    films(alaska),
    films(house),
    films(sandra),  
    films(married).

genre(hitman_is_bodyguard) :-
    films(job),
    films(comedy),
    films(person),
    films(samuel),
    films(action),
    films(law).

genre(super_nannies) :-
    films(trouble),
    films(friends),
    films(phillip),

    films(back_to_the_future),
    films(law),
    films(comedy).

genre(honors_teacher) :-
    films(law),
    films(school),
    films(treasure),
    films(barek),

    films(comedy),
    films(trouble).

desc(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.
