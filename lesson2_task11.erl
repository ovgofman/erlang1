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
-import(helper_funcs, [le2ltec_mod/3, first/1]).

%% @spec 11. [a,a,a,b,c,c] -> [{3,a},b,{2,c}]
encode_modified(L) -> le2ltec_mod(L, 0, first(L)).
