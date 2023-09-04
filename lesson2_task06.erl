%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(lesson2_task06).
-author("alex").

%% API
-export([
  is_palindrome/1   % [1] -> true; [a,a] -> true; [a,b,c] -> false
]).
-import(lesson2_task04, [len/1]).
-import(lesson2_task05, [reverse/1]).
-import(helper_funcs, [take/2, compare/2]).

%% @spec 6. Returns 'true' if palindrome, 'false' otherwise
is_palindrome(L) ->
  LL = len(L) div 2,
  L2 = take(L, LL),
  R2 = take(reverse(L), LL),
  compare(L2, R2).
