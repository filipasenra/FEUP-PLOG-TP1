
/* ========================================================================== */
/* =================== All Points In every Column =========================== */
/* Receives a List of Lists */

allPointsColumn([], 0).

allPointsColumn([Head | Tail], Points) :-
length(Head, LenList),
allPointsColumnAUX([Head | Tail], LenList, Points).

allPointsColumnAUX(_, 0, _).

allPointsColumnAUX(ListOfLists, LenList, Points) :-
pointsInColumn(ListOfLists, Points, LenList),
NewLenList is LenList - 1,
allPointsColumnAUX(ListOfLists, NewLenList, Points).

/* ========================================================================= */
/* =================== All Points In a every Row =========================== */
/* Receives a List of Lists */

allPointsRow([], _).

allPointsRow([Head | Tail], Points) :-
pointsInRow(Head, Points),
allPointsRow(Tail, Points).



/* =================== All Points In a Column =========================== */
pointsInColumn([], _, _).

pointsInColumn(ListOfLists, Points, N_element) :-
getColumnList(ListOfLists, [], ColumnList, N_element),
pointsInRow(ColumnList, Points).


/* Get a List with the Elements of a Column */
getColumnList([], List, List, _).

getColumnList([Head | Tail], List, NewList, N_element) :-
nth1(N_element, Head, Elem),
append(List, [Elem], TMP),
getColumnList(Tail, TMP, NewList, N_element).

/* =================== All Points In a Row =========================== */

pointsInRow(List, Points) :-
checkPointsSizeRow(List, 0, NewPoints_Size),
checkPointsColourRow(List, 0, NewPoints_Colour),
checkPointsTypeRow(List, 0, NewPoints_Type),
Points is NewPoints_Size + NewPoints_Colour + NewPoints_Type.

pointsInRow([_ | Tail], Points) :-
pointsInRow(Tail, Points).


/* =================== SIZE =================== */
checkPointsSizeRow([], Points, Points).

checkPointsSizeRow([planet(Size_1, _, _) | Tail], Points, NewPoints) :-
checkPointsSizeRowCycle(Tail, Size_1, Points, NewPoints, 1).

checkPointsSizeRow([_ | Tail], Points, NewPoints) :-
checkPointsSizeRow(Tail, Points, NewPoints).


checkPointsSizeRowCycle([], _, Points, Points, _).

checkPointsSizeRowCycle([planet(Size_1, _, _) | Tail], Size, Points, NewPoints, N) :-
    Size == Size_1,
    N >= 2,
    NewPoints1 is Points + 1,
    N1 is N + 1,
    checkPointsSizeRowCycle(Tail, Size, NewPoints1, NewPoints, N1).

checkPointsSizeRowCycle([planet(Size_1, _, _) | Tail], Size, Points, NewPoints, N) :-
    Size == Size_1,
    N1 is N + 1,
    checkPointsSizeRowCycle(Tail, Size, Points, NewPoints, N1).

checkPointsSizeRowCycle([planet(Size_1, _, _) | Tail], _, Points, NewPoints, _) :-
checkPointsSizeRowCycle(Tail, Size_1, Points, NewPoints, 1).

checkPointsSizeRowCycle([_ | Tail], _, Points, NewPoints, _) :-
checkPointsSizeRow(Tail, Points, NewPoints).

/* =================== Colour =================== */
checkPointsColourRow([], Points, Points).

checkPointsColourRow([planet(_, Colour, _) | Tail], Points, NewPoints) :-
checkPointsColourRowCycle(Tail, Colour, Points, NewPoints, 1).

checkPointsColourRow([_ | Tail], Points, NewPoints) :-
checkPointsColourRow(Tail, Points, NewPoints).

checkPointsColourRowCycle([], _, Points, Points, _).

checkPointsColourRowCycle([planet(_, Colour_1, _) | Tail], Colour, Points, NewPoints, N) :-
    Colour == Colour_1,
    N >= 2,
    NewPoints1 is Points + 1,
    N1 is N + 1,
    checkPointsColourRowCycle(Tail, Colour, NewPoints1, NewPoints, N1).

checkPointsColourRowCycle([planet(_, Colour_1, _) | Tail], Colour, Points, NewPoints, N) :-
    Colour == Colour_1,
    N1 is N + 1,
    checkPointsColourRowCycle(Tail, Colour, Points, NewPoints, N1).

checkPointsColourRowCycle([planet(_, Colour_1, _) | Tail], _, Points, NewPoints, _) :-
checkPointsColourRowCycle(Tail, Colour_1, Points, NewPoints, 1).

checkPointsColourRowCycle([_ | Tail], _, Points, NewPoints, _) :-
checkPointsColourRow(Tail, Points, NewPoints).

/* =================== Type =================== */
checkPointsTypeRow([], Points, Points).

checkPointsTypeRow([planet(_, _, Type) | Tail], Points, NewPoints) :-
checkPointsTypeRowCycle(Tail, Type, Points, NewPoints, 1).

checkPointsTypeRow([_ | Tail], Points, NewPoints) :-
checkPointsTypeRow(Tail, Points, NewPoints).

checkPointsTypeRowCycle([], _, Points, Points, _).

checkPointsTypeRowCycle([planet(_, _, Type_1) | Tail], Type, Points, NewPoints, N) :-
    Type == Type_1,
    N >= 2,
    NewPoints1 is Points + 1,
    N1 is N + 1,
    checkPointsTypeRowCycle(Tail, Type, NewPoints1, NewPoints, N1).

checkPointsTypeRowCycle([planet(_, _, Type_1) | Tail], Type, Points, NewPoints, N) :-
    Type == Type_1,
    N1 is N + 1,
    checkPointsTypeRowCycle(Tail, Type, Points, NewPoints, N1).

checkPointsTypeRowCycle([planet(_, _, Type_1) | Tail], _, Points, NewPoints, _) :-
checkPointsTypeRowCycle(Tail, Type_1, Points, NewPoints, 1).

checkPointsTypeRowCycle([_ | Tail], _, Points, NewPoints, _) :-
checkPointsTypeRow(Tail, Points, NewPoints).

