%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task07).
-author("alex").

%% API
-export([
  flatten/1     % [a,[],[b,[c,[d]]]] -> [a,b,c,d]
]).
-import(lesson2_task05, [reverse/1]).

%% @spec 7. Flatten nested lists
flatten(L) ->
  reverse(fltn(L, [])).

%% @spec Flattens lists, and returns it in reversed order
% [a,[],[b,[c,[d]]]] -> [d,c,b,a]
fltn(L, R) ->
  case L of
    [] -> R;
    [H | T] ->
      Y = isList(H),
      if
        Y -> fltn(T, fltn(H, R));
        true -> fltn(T, [H | R])
      end
  end.

isList(L) ->
  case L of
    [] -> true;
    [_ | _] -> true;
    _ -> false
  end.
