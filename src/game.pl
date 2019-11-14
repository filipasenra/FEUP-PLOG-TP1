:- consult('menu.pl').
:- consult('logic.pl').
:- consult('board.pl').
:- consult('input.pl').
:- consult('points.pl').

:- use_module(library(lists)).
:- use_module(library(random)).

exo :-
  printMainMenu,
  readOption,
  read(Input),
  handleOption(Input).
