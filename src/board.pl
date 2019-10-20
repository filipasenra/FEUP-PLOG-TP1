/* Estados iniciais */

initialBoardP1([
[sun]]).

initialBoardP2([
[sun]]).


/* Estados intermédios */

intermediateBoardP1([
[empty, planet(medium, white, terrestrial), empty], 
[empty, planet(medium, green, terrestrial), planet(small, green, gaseous)],
[empty, planet(small, red, terrestrial), planet(large, green, gaseous)],
[planet(small, red, ringed), sun, empty]]).

intermediateBoardP2([
[empty, planet(medium, white, terrestrial), empty], 
[empty, planet(medium, green, terrestrial), planet(small, green, gaseous)],
[empty, planet(small, red, terrestrial), planet(large, green, gaseous)],
[planet(small, red, ringed), sun, empty]]).



/*Estados finais */

finalBoardP1([
[empty, empty, planet(small, white, ringed), planet(medium, white, ringed)], 
[empty, empty, planet(medium, white, terrestrial), planet(medium, white, gaseous)], 
[empty, planet(medium, green, ringed), planet(medium, green, terrestrial), planet(small, green, gaseous)],
[empty, empty, planet(small, red, terrestrial), planet(large, green, gaseous)],
[empty, planet(small, red, ringed), sun, planet(large, red, ringed)],
[planet(medium, red, gaseous), planet(small, white, terrestrial), empty, empty]]).

finalBoardP2([
[empty, empty, planet(small, white, ringed), planet(medium, white, ringed)], 
[empty, empty, planet(medium, white, terrestrial), planet(medium, white, gaseous)], 
[empty, planet(medium, green, ringed), planet(medium, green, terrestrial), planet(small, green, gaseous)],
[empty, empty, planet(small, red, terrestrial), planet(large, green, gaseous)],
[empty, planet(small, red, ringed), sun, planet(large, red, ringed)],
[planet(medium, red, gaseous), planet(small, white, terrestrial), empty, empty]]).




/* Prints the Matrix */
display_game([]).

display_game([Head | Tail]) :-
    length(Head, LenList),
    write('\n'),
    writeDivisions(LenList),
    write(' '),
    printLine(Head),
    display_game(Tail).

/* Writing Divisions */
writeDivisions(0) :- write('\n').

writeDivisions(N) :-
    N > 0,
    N1 is N - 1,
    write('-----|'),
    writeDivisions(N1).

/* Prints each Line */
printLine([]).

printLine([Head|Tail]) :-
    symbol(Head, S),
    write(S),
    write(' | '),
    printLine(Tail).


/*Representing a play */

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
