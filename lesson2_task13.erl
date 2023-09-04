%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task13).
-author("alex").

%% API
-export([
  decode/1          % [{3,a},{b},{2,c}] -> [a,a,a,b,c,c]
]).
-import(lesson2_task05, [reverse/1]).
-import(lesson2_task07, [flatten/1]).
-import(helper_funcs, [ltec2le/2]).

%% @spec 13. [{3,a},{b},{2,c}] -> [a,a,a,b,c,c]
decode(L) -> reverse(flatten(ltec2le(L, []))).
