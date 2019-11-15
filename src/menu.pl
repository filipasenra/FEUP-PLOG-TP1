handleOption(1) :-
    write('\nPlayer 1: '),
    read(Player1),
    write('\nPlayer 2: '),
    read(Player2),
    startGame(Player1, Player2),
    mainMenu.

handleOption(2) :-
    write('\nPlayer: '),
    read(Player),
    startGamePvsC(Player),
    mainMenu.

handleOption(3) :-
    /*startGame('C','C'),*/
    mainMenu.

handleOption(0) :-
    write('\nSee you next time!\n\n').

handleOption(_) :-
    write('\nInvalid option! Try again.\n\n'),
    readOption,
    read(Input),
    handleOption(Input).

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

readOption :-
    write('Option: ').
