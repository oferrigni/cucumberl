%%%-------------------------------------------------------------------
%%% @author Oliver Ferrigni
%%% @end
%%%-------------------------------------------------------------------

-module(cucumber_server).

-behaviour(gen_server).

%% API
-export([
         start_link/1,
         start_link/0,
         get_count/0,
         stop/0
         ]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).
-define(DEFAULT_PORT, 2011).

-record(state, {port, lsock}).

%%%===================================================================
%%% API
%%%===================================================================

	

%%--------------------------------------------------------------------
%% @doc Starts the server.
%%
%% @spec start_link(Port::integer()) -> {ok, Pid}
%% where
%%  Pid = pid()
%% @end
%%--------------------------------------------------------------------
start_link(Port) ->
	 %io:format("I should definitely see this only once~n"),
    gen_server:start_link({local, ?SERVER}, ?MODULE, [Port], []).

%% @spec start_link() -> {ok, Pid}
%% @doc Calls `start_link(Port)' using the default port.
start_link() ->
    start_link(?DEFAULT_PORT).

%%--------------------------------------------------------------------
%% @doc Fetches the number of requests made to this server.
%% @spec get_count() -> {ok, Count}
%% where
%%  Count = integer()
%% @end
%%--------------------------------------------------------------------
get_count() ->
    gen_server:call(?SERVER, get_count).

%%--------------------------------------------------------------------
%% @doc Stops the server.
%% @spec stop() -> ok
%% @end
%%--------------------------------------------------------------------
stop() ->
    gen_server:cast(?SERVER, stop).

accept_loop(LSock) ->
    {ok, Sock} = gen_tcp:accept(LSock),
		{ok, Child} = cucumber_client_sup:start_child(Sock),
		gen_tcp:controlling_process(Sock, Child),
		gen_server:cast(Child, socket_given),
		accept_loop(LSock).


%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([Port]) ->
    {ok, LSock} = gen_tcp:listen(Port, [{active, once}]),
    {ok, #state{port = Port, lsock = LSock}, 0}.


handle_call(get_count, _From, State) ->
    {reply, {ok, State}, State};


handle_call(_, _From, State) ->
    {reply, {ok, something}, State}.
	
	handle_cast(stop, State) ->
    {stop, normal, State}.

handle_info({tcp, Socket, _RawData}, State) ->
    gen_tcp:send(Socket, io_lib:fwrite("[\"success\",[]]~n", [])),
    {noreply, State};

handle_info(timeout, #state{lsock = LSock } = State) ->
		accept_loop(LSock),
		{noreply, State};

handle_info({tcp_closed, _}, State) ->
		{noreply, State}.


terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.



