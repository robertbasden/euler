%https://projecteuler.net/problem=4

-module(euler_4).
-author("Robert Basden").
-export([
	main/0
]).

main() ->
	ToCheck = lists:reverse(lists:seq(100, 999)),
	lists:reverse(lists:usort(lists:flatten(lists:map(fun(Num) -> check_posibilities(Num) end, ToCheck)))).

check_posibilities(Number) ->
	StartingList = lists:reverse(lists:seq(100, 999)),
	Results = lists:map(fun(Num) -> Num * Number end, StartingList),
	Palindromes = lists:filter(fun(Num) -> is_palindromic(Num) end, Results).

is_palindromic(Number) ->
	NumberReversed = list_to_integer(lists:reverse(integer_to_list(Number))),
	Number =:= NumberReversed.