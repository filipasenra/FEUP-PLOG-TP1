:- consult('menu.pl').
:- consult('logic.pl').
:- consult('board.pl').
:- consult('input.pl').
:- consult('points.pl').

:- use_module(library(lists)).
:- use_module(library(random)).

game :-
  printMainMenu,
  askMenuOption,
  read(Input),
  handleOption(Input).
