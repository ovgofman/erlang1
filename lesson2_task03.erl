%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task03).
-author("alex").

%% API
-export([
  element_at/2    % f([a,b,c],2) -> c
]).
-import(lesson2_task04, [len/1]).

%% @spec 3. Finds elem at index N
element_at([H | T], N) ->
  LL = len([H | T]),
  if
    N > LL -> [];
    N < 0 -> [];
    N =:= 0 -> H;
    true -> element_at(T, N - 1)
  end.
