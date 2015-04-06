%https://projecteuler.net/problem=5

-module(euler_5).
-author("Robert Basden").
-export([
	main/1
]).

main(Count, NumberOfDigits) -> 
	case verify(Count, NumberOfDigits) of
		true -> Count;
		false -> main(Count + 1, NumberOfDigits)
	end.

main(NumberOfDigits) ->
	main(1, NumberOfDigits).	

verify(NumberToVerify, NumberOfDigits) ->
	Numbers = lists:seq(1, NumberOfDigits),
	lists:all(fun(Number) -> NumberToVerify rem Number =:= 0 end, Numbers).