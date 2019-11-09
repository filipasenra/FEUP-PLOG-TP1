:- consult('board.pl').

addPiece(coord(X, Y), planet(Size, Colour, Type), OldBoard, NewBoard) :-
        symbol(planet(Size, Colour, Type), S),
        addColumn(X, OldBoard, Board_1),
        addLine(Y, Board_1, Board_2),
        updateCoord(X, X1),
        updateCoord(Y, Y1),
        subsPosition(NewBoard, Board_2, coord(X1, Y1), S).

/* Correct Coordenates after adjusting Board*/

updateCoord(0, 0).
updateCoord(X, NewX) :- NewX is X - 1.

/* Adding Column */

addColumn(0, OldBoard, NewBoard) :-
    addEmptySpotFirst(OldBoard, NewBoard).

addColumn(X, [Head | Tail], NewBoard) :-
    length(Head, LenList),
    X > LenList,
    addEmptySpotLast([Head | Tail], NewBoard).

addColumn(X, OldBoard, OldBoard).

addEmptySpotLast([], []).

addEmptySpotLast([Head | Tail], [NewBoard | NewTail]) :-
    append(Head, [empty], NewBoard),
    addEmptySpotLast(Tail, NewTail).

addEmptySpotFirst([], []).

addEmptySpotFirst([Head | Tail], [NewBoard | NewTail]) :-
    append([empty], Head, NewBoard),
    addEmptySpotFirst(Tail, NewTail).


/* END Adding Column */

/* Adding Line */

addLine(0, [OldBoard | Tail], NewBoard) :-
    length(OldBoard, LenList),
    constructLine(LenList, NewList),
    append([NewList], [OldBoard | Tail], NewBoard).

addLine(X, [OldBoard | Tail], NewBoard) :-
    length([OldBoard | Tail], N_Lines),
    X > N_Lines,
    length(OldBoard, LenList),
    constructLine(LenList, NewList),    
    append( [OldBoard | Tail], [NewList], NewBoard).

addLine(X, OldBoard, OldBoard).

constructLine(0, []).

constructLine(N, [NewLine | Tail]) :-
    N > 0,
    append([], empty, NewLine),
    N1 is N-1,
    constructLine(N1, Tail).

/* END Adding Line */
/* Finds List Where the element needs to be subs and replaces it */
subsPosition([NewBoard | Tail], [OldBoard | Tail], coord(X, 0), Element) :- 
    replace(OldBoard, X, Element, NewBoard).

subsPosition([T | NewBoard], [T|L], coord(X, Y), Element) :-
    element_at(NewBoard, L, coord(X, Y1), Element), 
    Y is Y1 + 1.

/* Subs Element at a certain Position of a List */

replace([_| Tail ], 0, X, [NewBoard | Tail]).

replace([H| Tail ], I, X, [H | RecursiveTail]):- 
    I > -1, 
    NI is I-1, 
    replace(Tail , NI, X, RecursiveTail), 
    !.

replace(L, _, _, L).






        