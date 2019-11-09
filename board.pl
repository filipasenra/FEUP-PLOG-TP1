initialBoard :- printMatrix([[sun]]).

printBoard(X) :-
    printMatrix(X).


%Writing Divisions%
writeDivisions(0) :- write('\n').

writeDivisions(N) :-
    N > 0,
    N1 is N - 1,
    write('-----|'),
    writeDivisions(N1).


%Prints the Matrix
printMatrix([]).

printMatrix([Head | Tail]) :-
    length(Head, LenList),
    writeDivisions(LenList),
    write(' '),
    printLine(Head),
    printMatrix(Tail).


%Prints each Line
printLine([]).

printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    write(' | '),
    printLine(Tail).

%Representing a player

symbol(empty, '   ').

symbol(sun, 'sun').

symbol(planet(Size, Colour, Type), S):-
    symbolSize(Size, S1),
    symbolColour(Colour, S2),
    symbolType(Type, S3),
    atom_concat(S1, S2, SF1),
    atom_concat(SF1, S3, S).

symbolColour(red,'R').
symbolColour(green,'G').
symbolColour(blue,'B').

symbolSize(small,'S').
symbolSize(medium,'M').
symbolSize(large,'L').

symbolType(terrestrial,'T').
symbolType(gaseous,'G').
symbolType(ringed,'R').
