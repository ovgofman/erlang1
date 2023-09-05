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

%% @spec 6. Returns 'true' if palindrome, 'false' otherwise
is_palindrome(L) ->
  LL = len(L) div 2,
  L2 = take(L, LL),
  R2 = take(reverse(L), LL),
  compare(L2, R2).

%% @spec Return first N elems.
%% take([1,2,3],2) -> [1,2]
take(L, N) -> loop(L, [], N).
loop(L, R, A) ->
  LL = len(L),
  if
    A > LL -> [];
    A =< 0 -> reverse(R);
    true -> case L of
              [] -> R;
              [H | T] -> loop(T, [H | R], A - 1)
            end
  end.

%% @spec Compare lists.
%% compare([1,2],[1,2]) -> true
compare(L, R) ->
  case {L, R} of
    {[H | []], [H2 | []]} when H =:= H2 -> true;
    {[H | T], [H2 | T2]} when H =:= H2 -> compare(T, T2);
    _ -> false
  end.
