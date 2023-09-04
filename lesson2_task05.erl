%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task05).
-author("alex").

%% API
-export([
  reverse/1   % [a,b] -> [b,a]
]).
-import(helper_funcs, [r/2]).

%% @spec 5. reverses the list
reverse(L) -> r(L, []).
