randomPos(Board, coord(Column, Row)) :-
  length(Board, LenList1),
  random(0, LenList1, Rand1),
  nth0(Row, Board, NewList),
  length(NewList, LenList2),
  random(0, LenList2, Rand2),
  Column is Rand1,
  Row is Rand2.

botTurn(Board, NewBoard, Cards, NewCards) :-
  randomPos(Board, coord(Column, Row)),
  random(0, 7, RandPlanet),
  getPlanet(Cards, RandPlanet, Planet),
  ((addPiece(coord(Column, Row), Planet, Board, NewBoard), !, eliminatePlanet(Cards, RandPlanet, NewCards));
  (botTurn(Board, NewBoard, Cards, NewCards))).

playGamePC(Board, NewBoard, Cards, NewCards) :-
  printCards(Cards),
  write('\n'),
  write('PC\'s play:\n'),
  botTurn(Board, NewBoard, Cards, NewCards),
  printBoard(NewBoard).

gameLoopPvsC(Player, BoardPlayer, BoardPC, Cards) :-
    playGame(BoardPlayer, NewBoardPlayer , Player, Cards, NewCards),
    playGamePC(BoardPC, NewBoardPC, NewCards, NewCards2),
    !,
    (isGameToContinue(NewCards2, NewBoardPlayer, NewBoardPC);
    (checkWinner(Player, NewBoardPlayer, NewBoardPC), !, false)),
    gameLoopPvsC(Player, NewBoardPlayer, NewBoardPC, NewCards2).

startGamePvsC(Player) :-
  initialBoard(BoardPlayer),
  initialBoard(BoardPC),
  allCards(AllCards),
  random_permutation(AllCards, AllCardsShuffled),
  gameLoopPvsC(Player, BoardPlayer, BoardPC, AllCardsShuffled);
  write('Thanks for Playing!\n').
