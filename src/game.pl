:- consult('menu.pl').
:- consult('logic.pl').
:- consult('board.pl').
:- consult('input.pl').
:- consult('points.pl').
:- consult('bot.pl').
:- consult('person.pl').

:- use_module(library(lists)).
:- use_module(library(random)).

exo :-
  clearScreen(_),
  printMainMenu,
  write('Option: '),
  read(Input),
  handleOption(Input).
