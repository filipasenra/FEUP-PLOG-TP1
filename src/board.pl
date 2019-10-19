/* Display game funcion */ 

 display_game(Board,Player) :-
    board(Board, Player).


/* Estados iniciais */

board(initial, player1) :- printMatrix([[sun]]).

board(initial, player2) :- printMatrix([[sun]]).


/* Estados intermédios */

board(intermediate, player1) :- 
    printMatrix(
        [[empty, planet(medium, white, terrestrial), empty], 
        [empty, planet(medium, green, terrestrial), planet(small, green, gaseous)],
        [empty, planet(small, red, terrestrial), planet(large, green, gaseous)],
        [planet(small, red, ringed), sun, empty]]).


board(intermediate, player2) :- 
    printMatrix(
        [[planet(large, green, terrestrial), empty, empty], 
        [planet(small, green, terrestrial), empty, planet(medium, white, gaseous)],
        [sun, planet(medium, green, gaseous), empty],
        [planet(small, red, gaseous), empty, planet(small, green, ringed)]]).


/*Estados finais */

board(final, player1) :- 
    printMatrix(
        [[empty, empty, planet(small, white, ringed), planet(medium, white, ringed)], 
        [empty, empty, planet(medium, white, terrestrial), planet(medium, white, gaseous)], 
        [empty, planet(medium, green, ringed), planet(medium, green, terrestrial), planet(small, green, gaseous)],
        [empty, empty, planet(small, red, terrestrial), planet(large, green, gaseous)],
        [empty, planet(small, red, ringed), sun, planet(large, red, ringed)],
        [planet(medium, red, gaseous), planet(small, white, terrestrial), empty, empty]]).

board(final, player2) :- 
   printMatrix(
        [[planet(large, white, ringed), empty, empty],
        [planet(large, green, ringed), empty, empty],
        [planet(large, green, terrestrial), empty, planet(medium, white, terrestrial)], 
        [planet(small, green, terrestrial), empty, planet(medium, white, gaseous)],
        [sun, planet(medium, green, gaseous), planet(medium, red, ringed)],
        [planet(small, red, gaseous), planet(small, white, gaseous), planet(small, green, ringed)],
        [planet(large, red, gaseous), empty, planet(large, white, ringed)]]).

/* ========================================================================================================================*/
    
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
    write('\n'),
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

symbolSize(small,'S').
symbolSize(medium,'M').
symbolSize(large,'L').

symbolColour(red,'R').
symbolColour(green,'G').
symbolColour(white,'W').

symbolType(terrestrial,'T').
symbolType(gaseous,'G').
symbolType(ringed,'R').
