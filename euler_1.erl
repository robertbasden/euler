%https://projecteuler.net/problem=1

-module(euler_1).
-author("Robert Basden").
-export([
	main/2,
	sum_multiples/1,
	get_multiples/3,
	is_multiple_of_any/2
]).

main(Max, Choice) -> sum_multiples(get_multiples(Max, Choice, 1)).

sum_multiples(List) -> lists:foldl(fun(X, Sum) -> X + Sum end, 0, List).

is_multiple_of_any(Value, List) -> lists:any(fun(Elem) -> Value rem Elem =:= 0 end, List).

get_multiples(Max, _, Count) when Count >= Max -> [];
get_multiples(Max, Choice, Count) -> 
	case is_multiple_of_any(Count, Choice) of
		true -> 
			[Count|get_multiples(Max, Choice, Count + 1)];
		false -> 
			get_multiples(Max, Choice, Count + 1)
	end.
