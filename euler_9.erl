%https://projecteuler.net/problem=9

-module(euler_9).
-author("Robert Basden").
-export([
	main/0,
	check_natural/1,
	check_tripplet/1
]).

main() ->
	Possibilities = [{A,B,math:sqrt((A*A)+(B*B))} || A <- lists:seq(1,1000), B <- lists:seq(1,1000)],
	{A,B,C} = lists:last(lists:filter(fun(T) -> check_tripplet(T) end, Possibilities)),
	trunc(A * B * C).

check_natural(Number) ->
	Number / trunc(Number) =:= 1.0.

check_tripplet({A, B, C}) ->
	check_natural(C) and (A + B + C =:= 1000.0) and (A < B) and (B < C).
