-module(cucumberl_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).
-export([start/0]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
  cucumberl_sup:start_link().

start() ->
  application:load(cucumberl),
  application:start(cucumberl).

stop(_State) ->
    ok.
