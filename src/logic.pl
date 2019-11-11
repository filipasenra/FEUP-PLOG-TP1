addPiece(coord(X, Y), planet(Size, Colour, Type), OldBoard, NewBoard) :-
        symbol(planet(Size, Colour, Type), S),
        addColumn(X, OldBoard, Board_1).
        /*addLine(Y, Board_1, Board_2)./*subs empty*/


/* Adding Column */

addColumn(0, OldBoard, NewBoard) :-
    addEmptySpotFirst(OldBoard, NewBoard).

addColumn(X, [Head | Tail], NewBoard) :-
    length(Head, LenList),
    X > LenList,
    ddEmptySpotLast([Head | Tail], NewBoard).


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

constructLine(0, []).

constructLine(N, [NewLine | Tail]) :-
    N > 0,
    append([], empty, NewLine),
    N1 is N-1,
    constructLine(N1, Tail).

/* END Adding Line */
