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
-import(helper_funcs, [fltn/2]).

%% @spec 7. Flatten nested lists
flatten(L) -> reverse(fltn(L, [])).
