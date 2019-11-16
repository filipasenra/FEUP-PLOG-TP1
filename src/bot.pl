/* Get a random position for the PC's play */
randomPos(Board, coord(Column, Row)) :-
  length(Board, NumColumns),
  !,
  (random(0, NumColumns, RandCol),
  nth0(RandCol, Board, ListCol),
  length(ListCol, NumRows),
  !,
  (random(0, NumRows, RandRow),
  random(0, 3, AddCol),
  random(0, 3, AddRow),
  Column is RandCol + AddCol,
  Row is RandRow + AddRow)).

/* Get a random position for the PC's play */
randomPosSmart(Board, coord(Column, Row)) :-
  length(Board, NumColumns),
  !,
  (random(0, NumColumns, RandCol),
  nth0(RandCol, Board, ListCol),
  length(ListCol, NumRows),
  !,
  (random(0, NumRows, RandRow),
  random(0, 3, AddCol),
  Column is RandCol + AddCol,
  Row is RandRow)).

/* PC's play */

pcTurn(Board, NewBoard, Cards, NewCards, 2) :-
  randomPosSmart(Board, coord(Column, Row)),
  length(Cards, NumPlanets),
  Total is NumPlanets + 1,
  random(1, Total, RandPlanet),
  getPlanet(Cards, RandPlanet, Planet),
  !,
  ((addPiece(coord(Column, Row), Planet, Board, NewBoard), !, eliminatePlanet(Cards, RandPlanet, NewCards));
  pcTurn(Board, NewBoard, Cards, NewCards, 2)).


pcTurn(Board, NewBoard, Cards, NewCards, 1) :-
  randomPos(Board, coord(Column, Row)),
  length(Cards, NumPlanets),
  Total is NumPlanets + 1,
  random(1, Total, RandPlanet),
  getPlanet(Cards, RandPlanet, Planet),
  !,
  ((addPiece(coord(Column, Row), Planet, Board, NewBoard), !, eliminatePlanet(Cards, RandPlanet, NewCards));
  pcTurn(Board, NewBoard, Cards, NewCards, 1)).


playGamePC(Board, NewBoard, Cards, NewCards, Mode) :-
  printCards(Cards),
  write('\n'),
  (pcTurn(Board, NewBoard, Cards, NewCards, Mode), !, printBoard(NewBoard), write('\n\n\n')).


/* =========================================================================== */
/*                              Player vs Computer                             */
/* =========================================================================== */

gameLoopPvsC(Player, BoardPlayer, BoardPC, Cards, Mode) :-
    playGame(BoardPlayer, NewBoardPlayer , Player, Cards, NewCards),
    write('\n\n\n PC played: \n'),
    playGamePC(BoardPC, NewBoardPC, NewCards, NewCards2, Mode),
    !,
    (isGameToContinue(NewCards2);
    (checkWinner(Player, 'PC', NewBoardPlayer, NewBoardPC), !, false)), !,
    gameLoopPvsC(Player, NewBoardPlayer, NewBoardPC, NewCards2, Mode).

startGamePvsC(Player, Mode) :-
  initialBoard(BoardPlayer),
  initialBoard(BoardPC),
  allCards(AllCards),
  random_permutation(AllCards, AllCardsShuffled),
  gameLoopPvsC(Player, BoardPlayer, BoardPC, AllCardsShuffled, Mode);
  write('Thanks for Playing!\n').


/* =========================================================================== */
/*                            Computer vs Computer                             */
/* =========================================================================== */

gameLoopCvsC(BoardPC1, BoardPC2, Cards) :-
  read_line(_),
  write('PC1: \n'),
  playGamePC(BoardPC1, NewBoardPC1, Cards, NewCards, 1),
  write('PC2: \n'),
  playGamePC(BoardPC2, NewBoardPC2, NewCards, NewCards2, 1),
  !,
  (isGameToContinue(NewCards2);
  (checkWinner('PC1', 'PC2', NewBoardPC1, NewBoardPC2), !, false)), !,
  gameLoopCvsC(NewBoardPC1, NewBoardPC2, NewCards2).

startGameCvsC :-
  initialBoard(BoardPC1),
  initialBoard(BoardPC2),
  allCards(AllCards),
  random_permutation(AllCards, AllCardsShuffled),
  gameLoopCvsC(BoardPC1, BoardPC2, AllCardsShuffled);
  write('Thanks for Playing!\n').