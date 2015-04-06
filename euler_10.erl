%https://projecteuler.net/problem=10

-module(euler_10).
-author("Robert Basden").
-export([
	main/0,
	main/1
]).

main(Limit) ->
	PrimesList = get_primes([2], 2, Limit),
	lists:foldl(fun(Number, Sum) -> Number + Sum end, 0, PrimesList).

main() ->
	main(2000000).

get_primes(List, Count, Limit) when Count > Limit -> List;
get_primes(List, Count, Limit) ->
	case lists:any(fun(Number) -> Count rem Number =:= 0 end, List) of
		false -> get_primes([Count|List], Count + 1, Limit); %Prime
		true -> get_primes(List, Count + 1, Limit) %Not prime
	end.