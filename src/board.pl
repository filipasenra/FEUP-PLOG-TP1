initialBoard([[sun]]).

printBoard([Head | Tail]) :-
    length(Head, LenList),
    writeNumbersRow(LenList, 0),
    writeDivisions(LenList),
    printMatrix([Head | Tail], 0, LenList).


%Writing Divisions%
writeDivisions(0) :- write('-----|-----|-----|\n').

writeDivisions(N) :-
    N > 0,
    N1 is N - 1,
    write('-----|'),
    writeDivisions(N1).


/* Write Top Row Of Numbers */

/* Base Case */
writeNumbersRow(N, CurrentNumber) :- 
    CurrentNumber > N + 1,
    write('\n').

/* Special Case to Add the First Space*/
writeNumbersRow(N, 0) :-
    write('     |'),
    writeNumber(0),
    writeNumbersRow(N, 1).

/* Recursive Case */
writeNumbersRow(N, CurrentNumber) :-
    CurrentNumber =< N + 1,
    writeNumber(CurrentNumber),
    N1 is CurrentNumber + 1,
    writeNumbersRow(N, N1).

/* Write Number*/
writeNumber(N) :-
 write('  '), write(N), write('  |').


/* Prints N empty Spaces */
writeEmptySpaces(0) :-
    write('     |     |\n').

writeEmptySpaces(N) :-
    write('     |'),
    N1 is N-1,
    writeEmptySpaces(N1).



%Prints the Matrix
printMatrix([], N, LenList) :-
    writeNumber(N),
    writeEmptySpaces(LenList),
    write('\n').

printMatrix([Head | Tail], 0, LenList) :-
    writeNumber(0),
    writeEmptySpaces(LenList),
    writeDivisions(LenList),
    printMatrix([Head | Tail], 1, LenList).

printMatrix([Head | Tail], N, LenList) :-
    writeNumber(N),
    write('     |'),
    printLine(Head),
    writeDivisions(LenList),
    N1 is N+1,
    printMatrix(Tail, N1, LenList).


%Prints each Line
printLine([]) :- write('     |\n').

printLine([Head|Tail]) :-
    symbol(Head, S),
    write(' '),
    write(S),
    write(' |'),
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
