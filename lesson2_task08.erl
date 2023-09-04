%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task08).
-author("alex").

%% API
-export([
  compress/1          % [a,a,b] -> [a,b]
]).
-import(lesson2_task05, [reverse/1]).
-import(helper_funcs, [remove_dups/2]).

%% @spec 8. Removes sequenced dups
compress(L) -> reverse(remove_dups(L, [])).
