manageRow(NewRow) :-
    readRow(NewRow).
    /* validateRow(Row, NewRow).*/

manageColumn(NewColumn) :-
    readColumn(NewColumn).
    /* validateColumn(Column, NewColumn).*/

readRow(Row) :-
    write('  > Row    '),
    read(Row).

readColumn(Column) :-
    write('  > Column '),
    read(Column).