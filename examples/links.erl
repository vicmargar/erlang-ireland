-module(links).
-export([parent/0, son/0]).

parent() ->
    process_flag(trap_exit, true),
    PidSon = spawn_link(links, son, []),
    io:format("Parent: ~p, Son: ~p~n", [self(), PidSon]),
    receive_messages().

receive_messages() ->
    receive
        Msg ->
            io:format("Message Parent: ~p~n", [Msg]),
            receive_messages()
    end.

son() ->
    receive
        Msg ->
            io:format("Message Son: ~p~n", [Msg]),
            son()
    end.