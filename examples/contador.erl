-module(counter).

-export([count/0]).

count() ->
    count(0).

count(Value) ->
    receive
        count ->
            count(Value + 1);
        value ->
            io:format("The value is: ~p~n", [Value]),
            count(Value);
        Msg ->
            io:format("Unknown message: ~p~n", [Msg]),
            count(Value)
    end.
