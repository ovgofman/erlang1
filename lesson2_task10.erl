%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task10).
-author("alex").

%% API
-export([
  encode/1      % [a,a,a,b,c,c] -> [{3,a},{1,b},{2,c}]
]).
-import(helper_funcs, [le2ltec/3, first/1]).

%% @spec 10. [a,a,a,b,c,c] -> [{3,a},{1,b},{2,c}]
encode(L) -> le2ltec(L, 0, first(L)).
