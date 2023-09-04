%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task15).
-author("alex").

%% API
-export([
  replicate/2         % f([a,b],3) -> [a,a,a,b,b,b]
]).
-import(lesson2_task07, [flatten/1]).
-import(helper_funcs, [times/2]).

%% @spec 15. Returns a list where each elem is repeated N times
replicate(L, N) ->
  case L of
    [] -> L;
    [H | T] -> flatten([times(H, N) | replicate(T, N)])
  end.
