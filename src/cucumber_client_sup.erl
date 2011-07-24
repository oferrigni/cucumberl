%%%-------------------------------------------------------------------
%%% @author oferrigni
%%% @copyright (C) 2011, oferrigni
%%% @doc
%%%
%%% @end
%%% Created : 2011-04-12 20:02:24.241272
%%%-------------------------------------------------------------------
-module(cucumber_client_sup).

-behaviour(supervisor).

%% API
-export([start_link/0,
				 start_child/2]).

%% Supervisor callbacks
-export([init/1]).

-define(CHILD(I, Type), {I, {I, start_link, []}, temporary, 5000, Type, [I]}).
-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
			%io:format("Starting client supervisor~n"),
				{ok, _Pid} = supervisor:start_link({local, ?SERVER}, ?MODULE, []).

start_child(Socket, Pid) ->
				%io:format("Staring a new child on Socket ~p ~n", [Socket]),
				supervisor:start_child(?MODULE, [Socket,Pid]).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @spec init(Args) -> {ok, {SupFlags, [ChildSpec]}} |
%%                     ignore |
%%                     {error, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
			%io:format("In init of client supervisor~n"),
        RestartStrategy = simple_one_for_one,
        MaxRestarts = 0,
        MaxSecondsBetweenRestarts = 1,

        SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

        AChild = ?CHILD(cucumber_client, worker),

        {ok, {SupFlags, [AChild]}}.

%%%===================================================================
%%% Internal functions
%%%===================================================================



