%https://projecteuler.net/problem=3

-module(euler_3).
-author("Robert Basden").
-export([
	main/1,
	get_factors/1,
	is_factor/2,
	is_prime/1
]).

main(Input) ->
	Factors = get_factors(Input),
	lists:filter(fun(Item) -> is_prime(Item) end, Factors).

is_prime(Number) ->
	length(get_factors(Number)) =:= 2.

get_factors(Input, Count, Limit) when Count > Limit -> [];
get_factors(Input, Count, Limit) when Input rem Count =:= 0 -> [Count|get_factors(Input, Count + 1, Limit)];
get_factors(Input, Count, Limit) -> get_factors(Input, Count + 1, Limit).

get_factors(Input) ->
	FirstSet = get_factors(Input, 0, math:sqrt(Input)),
	SecondSet = lists:map(fun(Item) -> round(Input / Item) end, FirstSet),
	lists:usort(lists:merge(FirstSet, SecondSet)).

is_factor(ValueToCheck, Target) ->
	Target rem ValueToCheck =:= 0.