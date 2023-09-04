%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task12).
-author("alex").

%% API
-export([
  decode_modified/1     % [{3,a},b,{2,c}] -> [a,a,a,b,c,c]
]).
-import(lesson2_task05, [reverse/1]).
-import(lesson2_task07, [flatten/1]).
-import(helper_funcs, [ltec2le_mod/2]).

%% @spec 12. [{3,a},b,{2,c}] -> [a,a,a,b,c,c]
decode_modified(L) -> reverse(flatten(ltec2le_mod(L, []))).
