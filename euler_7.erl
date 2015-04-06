%https://projecteuler.net/problem=7

-module(euler_7).
-author("Robert Basden").
-export([
	main/1
]).

main(Position) ->
	find_prime_at_position(Position, [2]).

next_prime(PrimeList, Count) ->
	case lists:any(fun(Number) -> Count rem Number =:= 0 end, PrimeList) of
		false -> Count;
		true -> next_prime(PrimeList, Count + 1)
	end.

next_prime(PrimeList) ->
	next_prime(PrimeList, lists:last(PrimeList) + 1).

find_prime_at_position(Position, PrimeList) when length(PrimeList) =:= Position -> lists:last(PrimeList);
find_prime_at_position(Position, PrimeList) ->
	NewPrimeList = lists:append(PrimeList, [next_prime(PrimeList)]),
	find_prime_at_position(Position, NewPrimeList).