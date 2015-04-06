%https://projecteuler.net/problem=6

-module(euler_6).
-author("Robert Basden").
-export([
	main/1
]).

main(Count) ->
	square_of_sums(Count) - sum_of_squares(Count).
	
sum_of_squares(Count) ->
	lists:foldl(fun(Number, Sum) -> Number + Sum end, 0, [X*X || X <- lists:seq(1,Count)]).

square_of_sums(Count) ->
	Sum = lists:foldl(fun(Number, Sum) -> Number + Sum end, 0, lists:seq(1,Count)),
	Sum * Sum.