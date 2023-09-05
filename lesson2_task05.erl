%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task05).
-author("alex").

%% API
-export([
  reverse/1   % [a,b] -> [b,a]
]).

%% @spec 5. Reverses the list
reverse(L) ->
  r(L, []).
r(L, R) ->
  case L of
    [H | []] -> [H | R];
    [H | T] -> r(T, [H | R]);
    [] -> R
  end.
