%%%-------------------------------------------------------------------
%%% @author oferrigni
%%% @copyright (C) 2011, oferrigni
%%% @doc
%%%
%%% @end
%%% Created : 2011-04-12 20:16:55.033357
%%%-------------------------------------------------------------------
-module(cucumber_client).

-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {allStepModules}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
				%io:format("In start link of cucumber client ~n"),
        gen_server:start_link(?MODULE, [], []).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
        {ok, #state{allStepModules = discovery:all_step_modules()}, 0}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @spec handle_call(Request, From, State) ->
%%                                   {reply, Reply, State} |
%%                                   {reply, Reply, State, Timeout} |
%%                                   {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, Reply, State} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_call(_Request, _From, State) ->
        Reply = ok,
        {reply, Reply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @spec handle_cast(Msg, State) -> {noreply, State} |
%%                                  {noreply, State, Timeout} |
%%                                  {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_cast({socket_given, Sock}, State) ->
    inet:setopts(Sock, [{active, true}]),
    {noreply, State};

handle_cast(_Msg, State) ->
        {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info({tcp, Socket, _RawData}, #state{allStepModules =
		StepModules} = State) ->
		%try
		Result = cucumber:execute_json(_RawData, StepModules),
		case (Result) of 
      {ok, noreply} -> %io:format("Sending ~s~n~n", [mochijson2:encode([success])]),
        ok = gen_tcp:send(Socket, mochijson2:encode([success])),
        ok = gen_tcp:send(Socket, "\n");
      {fail, _Reply} -> %io:format("Sending ~s~n", [mochijson2:encode([fail])]),
        gen_tcp:send(Socket, mochijson2:encode([fail])),
        gen_tcp:send(Socket, "\n");
      {ok, new_line} -> ok;
      {ok, not_found} -> 
        %io:format("Did not find step, sending success~n"),
        gen_tcp:send(Socket, mochijson2:encode([success,[]])),
        gen_tcp:send(Socket, "\n");
      {ok, Response} ->  %io:format("Sending Response ~s~n",[Response]),
        gen_tcp:send(Socket, Response),
        gen_tcp:send(Socket, "\n");
      undefined -> %io:format("Unknown in client hit~n"),
        gen_tcp:send(Socket, io_lib:fwrite("[\"fail\",{~s}]~n", [Result]))
		end,
	%catch
		%error:Reason -> 
    %io:format("Caught an error! ~s with input ~p~n",[Reason, _RawData]),undefined
	%end,
    %gen_tcp:send(Socket, io_lib:fwrite("[\"success\",[]]~n", [])),
    {noreply, State};

handle_info({tcp_closed, _},State) ->
    %exit(die),
	{noreply, State};

handle_info(_Info, State) ->
        {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
terminate(_Reason, _State) ->
        ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
        {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================




