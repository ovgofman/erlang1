%%%-------------------------------------------------------------------
%%% @author alex
%%% @copyright (C) 2023
%%% @doc
%%%
%%% @end
%%% Created : 19. Aug 2023 11:26 PM
%%%-------------------------------------------------------------------
-module(hw2).
-author("alex").

%% API
-export([
  last/1,             % [a,b] -> b
  but_last/1,         % [a,b,c] -> [b,c]
  element_at/2,       % f([a,b,c],2) -> c
  len/1,              % [a,b] -> 2; [] -> 0
  reverse/1,          % [a,b] -> [b,a]
  is_palindrome/1,    % [1] -> true; [a,a] -> true; [a,b,c] -> false
  flatten/1,          % [a,[],[b,[c,[d]]]] -> [a,b,c,d]
  compress/1,         % [a,a,b] -> [a,b]
  pack/1,             % [a,a,a,b,c,c] -> [[a,a,a],[b],[c,c]]
  encode/1,           % [a,a,a,b,c,c] -> [{3,a},{1,b},{2,c}]
  encode_modified/1,  % [a,a,a,b,c,c] -> [{3,a},b,{2,c}]
  decode_modified/1,  % [{3,a},b,{2,c}] -> [a,a,a,b,c,c]
  decode/1,           % [{3,a},{b},{2,c}] -> [a,a,a,b,c,c]
  duplicate/1,        % [a,b] -> [a,a,b,b]
  replicate/2         % f([a,b],3) -> [a,a,a,b,b,b]
]).

-import(helper_funcs, [isEmpty/1, cnt/2, cnt_dups/3, compare/2, take/2, r/2, times/2, first/1, le2ltec/3, le2ltec_mod/3, ltec2le_mod/2, ltec2le/2, remove_dups/2, fltn/2]).

%%% @doc
%% Letters and their meanings:
%% L, R - are usually both lists when in use. L is usually used as an input, R on the other hand as an output.
%%
%% H, T - are Head, and Tail
%% if there is a need to use several Heads/Tails in the f - then it could be H2/T2, etc.
%% 
%% N - holds some sort of Number that in most cases is used as an accumulator


%% @spec 1. the very last elem of the list
last(L) ->
  case L of
    [H | []] -> H;
    [_ | T] -> last(T);
    _ -> []
  end.


%% @spec 2. Two last elems of the list
but_last(L) ->
  case reverse(L) of
    [H, H2 | _] -> [H2, H];
    _ -> L
  end.


%% @spec 3. find elem at index N
element_at([H | T], N) ->
  LL = len([H | T]),
  if
    N > LL -> [];
    N < 0 -> [];
    N =:= 0 -> H;
    true -> element_at(T, N - 1)
  end.


%% @spec 4. counts len of the list
len(L) -> cnt(L, 0).


%% @spec 5. reverses the list
reverse(L) -> r(L, []).


%% @spec 6. [1] -> true; [a,a] -> true; [a,b,c] -> false
is_palindrome(L) ->
  LL = len(L) div 2,
  L2 = take(L, LL),
  R2 = take(reverse(L), LL),
  compare(L2, R2).


%% @spec 7. Flatten nested lists
flatten(L) -> reverse(fltn(L, [])).


%% @spec 8. Remove seq dups
compress(L) -> reverse(remove_dups(L, [])).


%% @spec 9. Pack into nested list. TODO: Figure it out
%% [a,a,a,b,c,c] -> [[a,a,a],[b],[c,c]]
pack(L) -> L.


%% @spec 10. [a,a,a,b,c,c] -> [{3,a},{1,b},{2,c}]
encode(L) -> le2ltec(L, 0, first(L)).


%% @spec 11. [a,a,a,b,c,c] -> [{3,a},b,{2,c}]
encode_modified(L) -> le2ltec_mod(L, 0, first(L)).


%% @spec 12. [{3,a},b,{2,c}] -> [a,a,a,b,c,c]
decode_modified(L) -> reverse(flatten(ltec2le_mod(L, []))).


%% @spec 13. [{3,a},{b},{2,c}] -> [a,a,a,b,c,c]
decode(L) -> reverse(flatten(ltec2le(L, []))).


%% @spec 14. Duplicate each elem 2 times
duplicate(L) -> flatten(replicate(L, 2)).


%% @spec 15. replicate([a,b],3) -> [a,a,a,b,b,b]
replicate(L, N) ->
  case L of
    [] -> L;
    [H | T] -> flatten([times(H, N) | replicate(T, N)])
  end.
