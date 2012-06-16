-module(animals).

-export([sound/1]).

sound(dog) ->
    io:format("Whoof Whoof!~n");

sound(cat) ->
    io:format("Meow!~n");

sound(_Other) ->
    io:format("Grrrrrrrrrr!~n").