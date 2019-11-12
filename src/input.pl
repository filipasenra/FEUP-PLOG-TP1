manageRow(NewRow) :-
    readRow(NewRow).
    /* validateRow(Row, NewRow).*/

manageColumn(NewColumn) :-
    readColumn(NewColumn).
    /* validateColumn(Column, NewColumn).*/

managePlanet(planet(Size, Colour, Type)) :-
    readPlanet(planet(Size, Colour, Type)).
    /* validateRow(Row, NewRow).*/

readRow(Row) :-
    write('  > Row    '),
    read(Row).

readColumn(Column) :-
    write('  > Column '),
    read(Column).

    
readPlanet(planet(Size, Colour, Type)):-
    write('  > Planet:\n'),
    write('    > Size: '),
    read(Size),
    write('    > Colour: '),
    read(Colour),
    write('    > Type: '),
    read(Type).