%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 20. Aug 2023 6:51 PM
%%%-------------------------------------------------------------------
-module(helper_funcs).
-author("alex").

%% API
-export([
  isEmpty/1,
  cnt/2,
  r/2,
  compare/2,
  take/2,
  times/2,
  le2ltec/3,
  le2ltec_mod/3,
  first/1,
  compare_first_second_elems/1,
  ltec2le_mod/2,
  ltec2le/2,
  remove_dups/2,
  fltn/2,
  cnt_dups/4
]).
-import(hw2, [len/1, reverse/1, replicate/2]).

%%% @doc
%% Helper Functions:


%% @spec [] -> true; [_] -> false
isEmpty(L) ->
  case L of
    [] -> true;
    _ -> false
  end.


%% @spec cnt([1,2,3]) -> 3
cnt(L, N) ->
  case L of
    [_ | T] -> cnt(T, N + 1);
    _ -> N
  end.


%% @spec TODO: doesn't work
cnt_dups(L, R, E, A) ->
  case L of
%%    [] -> {A, E};
    [H | []] when H =:= E -> {A + 1, E};
    [H | T] when H =:= E -> cnt_dups(T, R, E, A + 1);
    [H | T] when H =/= E -> cnt_dups(T, [{A, E} | R], first(T), 0)
  end.


%% @spec Compare lists.
%% compare([1,2],[1,2]) -> true
compare(L, R) ->
  case {L, R} of
    {[H | []], [H2 | []]} when H =:= H2 -> true;
    {[H | T], [H2 | T2]} when H =:= H2 -> compare(T, T2);
    _ -> false
  end.


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


%% @spec Reverses order of L.
%% [1,2] -> [2,1]
r(L, R) ->
  case L of
    [H | []] -> [H | R];
    [H | T] -> r(T, [H | R]);
    [] -> R
  end.


%% @spec Creates a list of repeated elems.
%% f(E, 2) -> [E, E]
times(E, N) ->
  if
    N > 1 -> [E | times(E, N - 1)];
    true -> [E]
  end.


%% @spec Flattens lists, and returns it in reversed order
% [a,[],[b,[c,[d]]]] -> [d,c,b,a]
fltn(L, R) ->
  case L of
    [] -> R;
    [H | T] when is_list(H) -> fltn(T, fltn(H, R));
    [H | T] -> fltn(T, [H | R])
  end.


%% @spec le2ltec: List of Elems -> List of Tuples {Counter,Elem}
le2ltec(L, A, E) ->
  case L of
    [] -> {A, E};
    [H | T] when H =:= E -> le2ltec(T, A + 1, E);
    [H | T] when H =/= E -> [{A, E}, le2ltec(T, 1, first(H))]
  end.


%% @spec le2ltec_mod
le2ltec_mod(L, A, E) ->
  case L of
    [] -> {A, E};
    [H | T] when H =:= E -> le2ltec_mod(T, A + 1, E);
    [H | T] when H =/= E, A =/= 0 -> [{A, E}, le2ltec_mod(T, 1, first(H))]
  end.


%% @spec ltec2le_mod
ltec2le_mod(L, R) ->
  case L of
    [] -> R;
    [H | T] when is_tuple(H) ->
      case H of
        {A, E} -> ltec2le_mod(T, [replicate([E], A) | R])
      end;
    [H | T] -> ltec2le_mod(T, [H | R])
  end.


%% @spec ltec2le
ltec2le(L, R) ->
  case L of
    [] -> R;
    [H | T] when is_tuple(H) ->
      case H of
        {A, E} -> ltec2le(T, [replicate([E], A) | R]);
        {E} -> ltec2le(T, [E | R])
      end
  end.


%% @spec Removes dups from the list, and returns it in the reversed order
% [1,1,1,2,2] -> [2,1]
remove_dups(L, R) ->
  case L of
    [] -> R;
    [H, H2 | T] when H =:= H2 -> remove_dups([H2 | T], R);
    [H | T] -> remove_dups(T, [H | R])
  end.


%% @spec Returns Head of a L if it exists
first(L) ->
  case L of
    [H | _] -> H;
    _ -> L
  end.


%% @spec Compares first 2 elements of the List.
% [e, e] -> true, [q, w] -> false
compare_first_second_elems(L) ->
  case L of
    [H, H2 | _] when H =:= H2 -> true;
    _ -> false
  end.
