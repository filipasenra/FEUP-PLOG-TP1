manageRow(NewRow) :-
    readRow(NewRow).
    /* validateRow(Row, NewRow).*/

manageColumn(NewColumn) :-
    readColumn(NewColumn).
    /* validateColumn(Column, NewColumn).*/

managePlanet(Planet) :-
    readPlanet(Planet).
    /* validateRow(Row, NewRow).*/

readRow(Row) :-
    write('  > Row    '),
    read(Row).

readColumn(Column) :-
    write('  > Column '),
    read(Column).

    
readPlanet(Planet):-
    write('  > Planet: '),
    read(Planet).