mainMenu :-
    printMainMenu,
    askMenuOption,
    read(Input),
    manageInput(Input).

manageInput(1) :-
    /*startGame('P','P'),*/
    mainMenu.

manageInput(2) :-
    /*startGame('P','C'),*/
    mainMenu.

manageInput(3) :-
    /*startGame('C','C'),*/
    mainMenu.

manageInput(4) :-
    write('Not a valid option!\n\n').

manageInput(0) :-
    write('\nSee you next time!\n\n').

manageInput(_Other) :-
    write('\nERROR: option '), write(_Other), write(' does not exist.\n\n'),
    askMenuOption,
    read(Input),
    manageInput(Input).

printMainMenu :-
    write(' _________________________________ EXO _________________________________ '),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                           CHOOSE GAME MODE:                           |'),nl,
    write('|                                                                       |'),nl,
    write('|                          1. Player vs Player                          |'),nl,
    write('|                                                                       |'),nl,
    write('|                          2. Player vs Computer                        |'),nl,
    write('|                                                                       |'),nl,
	write('|                          3. Computer vs Computer                      |'),nl,
    write('|                                                                       |'),nl,
    write('|                          0. Exit                                      |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                                       |'),nl,
    write('|                                                     Ana Filipa Senra  |'),nl,
    write('|                                                      Claudia Martins  |'),nl,
    write('|_______________________________________________________________________|'),nl, nl.

askMenuOption :-
    write('Option: ').