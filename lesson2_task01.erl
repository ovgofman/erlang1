%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task01).
-author("alex").

%% API
-export([
  last/1  % [a,b] -> b
]).

%% @spec 1. Returns the very last elem of the list
last(L) ->
  case L of
    [H | []] -> H;
    [_ | T] -> last(T);
    _ -> []
  end.
