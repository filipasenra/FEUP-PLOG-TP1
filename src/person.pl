
/* Gets Planet with a certain Index (starting at 1) */
getPlanet(Cards, IndexPlanet, Planet) :-
nth1(IndexPlanet, Cards, Planet).

/* Handles the a Turn of a Player */
playerTurn(Board, NewBoard, Cards, NewCards) :-
manageColumn(Column),
manageRow(Row),
managePlanet(IndexPlanet, Cards),
getPlanet(Cards, IndexPlanet, Planet),
!,
((addPiece(coord(Column, Row), Planet, Board, NewBoard), !, delete(Cards, Planet, NewCards));

(write('Not Possible!\n'), playerTurn(Board, NewBoard, Cards, NewCards))).

/* Handles the Turn of a Player and the Appropriate Output */
playGame(Board, NewBoard, Player, Cards, NewCards) :-
printCards(Cards),
write('\n'), printBoard(Board),
write(Player), write('\'s turn!\n'),
playerTurn(Board, NewBoard, Cards, NewCards).


clearScreen(_) :- write('\e[2J').

/* Indicates if the Game is to Continue (if it is not GameOver)*/
isGameToContinue(Cards) :-
length(Cards, LenList),
LenList > 1.

/* Loop of the Game with 2 humans */
gameLoop(Player1, Player2, BoardPlayer1, BoardPlayer2, Cards) :-
    /*clearScreen(_),*/
    playGame(BoardPlayer1, NewBoardPlayer1 , Player1, Cards, NewCards),
    /*clearScreen(_),*/
    playGame(BoardPlayer2, NewBoardPlayer2 , Player2, NewCards, NewCards2),
    !,
    (isGameToContinue(NewCards2);
    (checkWinner(Player1, Player2, NewBoardPlayer1, NewBoardPlayer2), !, fail)), !,
    gameLoop(Player1, Player2, NewBoardPlayer1, NewBoardPlayer2, NewCards2).

/* Start of a Game with 2 humans */
startGame(Player1, Player2) :-
      initialBoard(BoardPlayer1),
      initialBoard(BoardPlayer2),
      allCards(AllCards),
      random_permutation(AllCards, AllCardsShuffled),
      gameLoop(Player1, Player2, BoardPlayer1, BoardPlayer2, AllCardsShuffled);
      write('Thanks for Playing!\n').

/* Handles Actions After The Game is Finish (Game is Over)*/

checkWinner(Player1, Player2, BoardPlayer1, BoardPlayer2) :-
write(Player1), write('\n'),
printBoard(BoardPlayer1),
write(Player2), write('\n'),
printBoard(BoardPlayer2),
allPoints(BoardPlayer1, PointsPlayer1),
allPoints(BoardPlayer2, PointsPlayer2),
write(Player1), write(' points are '), write(PointsPlayer1), write('!\n'),
write(Player2), write(' points are '), write(PointsPlayer2), write('!\n'),
writeWinner(Player1, PointsPlayer1, Player2, PointsPlayer2).

/* Writes Who is the Winner */
writeWinner(Player1, PointsPlayer1, _, PointsPlayer2) :-
PointsPlayer1 > PointsPlayer2,
write(Player1), write(' won! Congratulations!\n').

writeWinner(_, _, Player2, _) :-
write(Player2), write(' won! Congratulations!\n').
