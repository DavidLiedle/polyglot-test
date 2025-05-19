% Verifies that the Erlang compiler runs.
-module(test).
-export([start/0]).

start() ->
  io:fwrite("Hello from Erlang!\n").

% Compile with: erlc test.erl && erl -noshell -s test start -s init stop
