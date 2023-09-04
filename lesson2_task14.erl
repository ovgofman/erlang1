%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task14).
-author("alex").

%% API
-export([
  duplicate/1           % [a,b] -> [a,a,b,b]
]).
-import(lesson2_task15, [replicate/2]).
-import(lesson2_task07, [flatten/1]).

%% @spec 14. Duplicate each elem 2 times
duplicate(L) -> flatten(replicate(L, 2)).
