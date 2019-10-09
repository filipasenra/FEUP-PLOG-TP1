%len of a string%
len([],0).

len([_|T],N)  :-  len(T,X),  N  is  X+1.

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
    len(Head, LenList),
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

symbol([], S) :- S='   '.

symbol([Size, Colour, Type], S):-
    symbolSize(Size, S1),
    symbolColour(Colour, S2),
    symbolType(Type, S3),
    atom_concat(S1, S2, SF1),
    atom_concat(SF1, S3, S).

symbolColour(red,S) :- S='R'.
symbolColour(green,S) :- S='G'.
symbolColour(blue,S) :- S='B'.

symbolSize(small,S) :- S='S'.
symbolSize(medium,S) :- S='M'.
symbolSize(large,S) :- S='L'.

symbolType(terrestrial,S) :- S='T'.
symbolType(gaseous,S) :- S='G'.
symbolType(ringed,S) :- S='A'.
