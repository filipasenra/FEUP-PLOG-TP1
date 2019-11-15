/* Get a random position for the PC's play */
randomPos(Board, coord(Column, Row)) :-
  length(Board, LenList1),
  LenListf1 is LenList1 + 1,
  random(0, LenListf1, Rand1),
  nth0(Row, Board, NewList),
  length(NewList, LenList2),
  LenListf2 is LenList2 + 1,
  random(0, LenListf2, Rand2),
  Column is Rand1,
  Row is Rand2.

/* Verify PC's play */
pcTurn(Board, NewBoard, Cards, NewCards) :-
  randomPos(Board, coord(Column, Row)),
  random(1, 7, RandPlanet),
  getPlanet(Cards, RandPlanet, Planet),
  ((addPiece(coord(Column, Row), Planet, Board, NewBoard), !, eliminatePlanet(Cards, RandPlanet, NewCards));
  (pcTurn(Board, NewBoard, Cards, NewCards))).

/* PC's play */
playGamePC(Board, NewBoard, Cards, NewCards) :-
  printCards(Cards),
  write('\n'),
  pcTurn(Board, NewBoard, Cards, NewCards),
  printBoard(NewBoard),
  write('\n\n\n').


/* =========================================================================== */
/*                              Player vs Computer                             */
/* =========================================================================== */

gameLoopPvsC(Player, BoardPlayer, BoardPC, Cards) :-
    playGame(BoardPlayer, NewBoardPlayer , Player, Cards, NewCards),
    write('\n\n\n PC played: \n'),
    playGamePC(BoardPC, NewBoardPC, NewCards, NewCards2),
    !,
    (isGameToContinue(NewCards2, NewBoardPlayer, NewBoardPC);
    (checkWinner(Player, 'PC', NewBoardPlayer, NewBoardPC), !, false)),
    gameLoopPvsC(Player, NewBoardPlayer, NewBoardPC, NewCards2).

startGamePvsC(Player) :-
  initialBoard(BoardPlayer),
  initialBoard(BoardPC),
  allCards(AllCards),
  random_permutation(AllCards, AllCardsShuffled),
  gameLoopPvsC(Player, BoardPlayer, BoardPC, AllCardsShuffled);
  write('Thanks for Playing!\n').


/* =========================================================================== */
/*                            Computer vs Computer                             */
/* =========================================================================== */

gameLoopCvsC(BoardPC1, BoardPC2, Cards) :-
    write('PC1: \n'),
    playGamePC(BoardPC1, NewBoardPC1, Cards, NewCards),
    write('PC2: \n'),
    playGamePC(BoardPC2, NewBoardPC2, NewCards, NewCards2),
    read(Input),
    !,
    (isGameToContinue(NewCards2, NewBoardPC1, NewBoardPC2);
    (checkWinner('PC1', 'PC2', NewBoardPC1, NewBoardPC2), !, false)),
    gameLoopCvsC(NewBoardPC1, NewBoardPC2, NewCards2).

startGameCvsC :-
  initialBoard(BoardPC1),
  initialBoard(BoardPC2),
  allCards(AllCards),
  random_permutation(AllCards, AllCardsShuffled),
  gameLoopCvsC(BoardPC1, BoardPC2, AllCardsShuffled);
  write('Thanks for Playing!\n').