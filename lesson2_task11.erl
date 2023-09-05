%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task11).
-author("alex").

%% API
-export([
  encode_modified/1     % [a,a,a,b,c,c] -> [{3,a},b,{2,c}]
]).
-import(lesson2_task05, [reverse/1]).

%% @spec 11. [a,a,a,b,c,c] -> [{3,a},b,{2,c}]
encode_modified(L) ->
  reverse(le2ltec(L, {0, first(L)}, [])).

%% @spec Accumulates tuples of {Counter, Element} in the R list
le2ltec(L, {Counter, Elem}, R) ->
  case L of
    [] -> R;
    [H | []] when H =:= Elem -> [{Counter + 1, Elem} | R];
    [H | T] when H =:= Elem -> le2ltec(T, {Counter + 1, Elem}, R);
    [H | []] when H =/= Elem -> [{1, H}, {Counter, Elem} | R];
    [H | T] when H =/= Elem -> le2ltec(T, {1, H}, [{Counter, Elem} | R])
  end.

%% @spec Returns Head of a L if it exists
first(L) ->
  case L of
    [H | _] -> H;
    _ -> L
  end.
