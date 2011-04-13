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

-record(state, {port, lsock,supPid}).

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
	  io:format("I should definitely see this only once~n"),
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


%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([Port]) ->
		io:format("Start listening on socket~n"),
		{ok, Pid} = cucumber_client_sup:start_link(),
    {ok, LSock} = gen_tcp:listen(Port, [{active, true}]),
    {ok, #state{port = Port, lsock = LSock,supPid = Pid}, 0}.



handle_call(get_count, _From, State) ->
    {reply, {ok, State}, State};


handle_call(_, _From, State) ->
   io:format("In handle call no match ~n"),
    {reply, {ok, something}, State}.
	
	handle_cast(stop, State) ->
    {stop, normal, State}.

handle_info({tcp, Socket, RawData}, State) ->
    io:format("In handle info dealing with incoming data ~p ~n", [RawData]),
    gen_tcp:send(Socket, io_lib:fwrite("[\"success\",[]]~n", [])),
    {noreply, State};

handle_info(timeout, #state{lsock = LSock, supPid = ThePid} = State) ->
    io:format("In handle info starting client supervisor ~n"),
		{ok, Child} = cucumber_client_sup:start_child(LSock, ThePid),
		{noreply, State#state{supPid = Child}};

handle_info({tcp_closed, _}, State) ->
		{noreply, State}.


terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.



