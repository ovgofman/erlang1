%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task02).
-author("alex").

%% API
-export([
  but_last/1  % [a,b,c] -> [b,c]
]).
-import(lesson2_task05, [reverse/1]).

%% @spec 2. Returns two last elems of the list
but_last(L) ->
  case reverse(L) of
    [H, H2 | _] -> [H2, H];
    _ -> L
  end.
