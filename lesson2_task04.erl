%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task04).
-author("alex").

%% API
-export([
  len/1   % [a,b] -> 2; [] -> 0
]).

%% @spec 4. Counts len of the list
len(L) ->
  cnt(L, 0).
cnt(L, N) ->
  case L of
    [_ | T] -> cnt(T, N + 1);
    _ -> N
  end.
