-module(recursion).
-export([duplicate/2, list_length/1, factorial/1, reverse/1, sub_list/2, zip/2]).

duplicate(N, Term) ->
    duplicate(N,Term, []).

duplicate(0, _, List) ->
    List;
duplicate(N, Term, List) when N > 0 ->
    duplicate(N - 1, Term, [Term| List]).


list_length(List) ->
    list_length(List, 0).

list_length([], Count) ->
    Count;
list_length([_|Tail], Count) ->
    list_length(Tail, 1+Count).

factorial(N) ->
    factorial(N, 1).

factorial(0, Result) ->
    1 * Result;
factorial(N, Result) ->
    factorial(N - 1, N * Result).

reverse(L) -> reverse(L, []).
reverse([], NewList) -> NewList;
reverse([H|T], NewList) -> reverse(T, [ H | NewList]).

sub_list(L, N) -> sub_list(L, N, []).

sub_list(_, 0, NewList) -> NewList;
sub_list(0, _, NewList) -> NewList;
sub_list([H|T], N, NewList) -> sub_list(T, N - 1, NewList ++ [H]).

zip(List1, List2) when length(List1) =:= length(List2) ->
    zip(List1,List2, []).

zip([], [], Result) -> Result;
zip([H1|T1], [H2|T2], Result) -> zip(T1, T2, Result ++ [{H1,H2}]).
