%https://projecteuler.net/problem=2

-module(euler_2).
-author("Robert Basden").
-export([
	main/1,
	get_fib_list/3,
	every_nth/2
]).

main(Limit) -> 
	Terms = [1,2|get_fib_list(2,1,Limit)],
	FilteredTerms = lists:filter(fun(E) -> E rem 2 =:= 0 end, Terms),
	lists:foldl(fun(X, Sum) -> X + Sum end, 0, FilteredTerms).

every_nth(N, [H|T], Count) when Count rem N =:= 0 -> [H|every_nth(N, T, Count + 1)];
every_nth(_, [], _) -> [];
every_nth(N, [_|T], Count) -> every_nth(N, T, Count + 1).

every_nth(N, List) -> every_nth(N, List, 1).


get_fib_list(Prev, Prev2, Limit) when (Prev + Prev2) > Limit -> [];
get_fib_list(Prev, Prev2, Limit) -> 
	T = Prev + Prev2,
	[T|get_fib_list(T, Prev, Limit)].