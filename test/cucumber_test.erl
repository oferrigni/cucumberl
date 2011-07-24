%%%-------------------------------------------------------------------
%%% @author Oliver Ferrigni
%%% @end
%%%-------------------------------------------------------------------

-module(cucumber_test).
-include_lib("eunit/include/eunit.hrl").
-compile(export_all).


execute_json_test() ->
	Json = "[\"step_matches\",{\"name_to_match\":\"I have cleared the calculator\"}]",
  ExpectedJson = mochijson2:encode([success, [{struct, [{id,'I have cleared the calculator'}, {args,[]}]}]]),
	AllStepModules = discovery:all_step_modules(),
	{ok,Result} = cucumber:execute_json(Json, AllStepModules),
	?assertEqual(ExpectedJson, Result).

execute_json_when_no_step_available_test() ->
	Json = "[\"step_matches\",{\"name_to_match\":\"I have cleared the calculator 1\"}]",
	AllStepModules = discovery:all_step_modules(),
	Result = cucumber:execute_json(Json, AllStepModules),
	?assertEqual({ok,not_found}, Result).

execute_json_when_begin_scenario_test() ->
	Json = "[\"begin_scenario\"]",
	AllStepModules = discovery:all_step_modules(),
	Result = cucumber:execute_json(Json, AllStepModules),
	?assertEqual({ok,noreply}, Result).

execute_json_when_begin_scenario_tags_test() ->
  meck:new(parsing),
  try 
    meck:expect(parsing, parse_json, fun("stub") -> {ok, begin_scenario, "foo"} end),
    {ok, noreply} = cucumber:execute_json("stub", []),
    ?assert(meck:validate(parsing))
  after
    meck:unload(parsing)
  end.

execute_json_when_end_scenario_test() ->
  meck:new(parsing),
  try 
    meck:expect(parsing, parse_json, fun("stub") -> {ok, end_scenario} end),
    {ok, noreply} = cucumber:execute_json("stub", []),
    ?assert(meck:validate(parsing))
  after
    meck:unload(parsing)
  end.

execute_json_when_end_scenario_tags_test() ->
  meck:new(parsing),
  try 
    meck:expect(parsing, parse_json, fun("stub") -> {ok, end_scenario, "foo"} end),
    {ok, noreply} = cucumber:execute_json("stub", []),
    ?assert(meck:validate(parsing))
  after
    meck:unload(parsing)
  end.

execute_json_when_invoke_test() ->
  meck:new(parsing),
  meck:new(utils),
  meck:new(discovery),
  try 
    meck:expect(parsing, parse_json, fun("stub") -> {ok, invoke, <<"foo">>, "baz"} end),
    meck:expect(utils, bitstring_to_atoms, fun(<<"foo">>) -> ['foo'] end),
    meck:expect(discovery, run_steps, fun([], ['foo']) -> {ok} end),
    {ok} = cucumber:execute_json("stub", []),
    ?assert(meck:validate(parsing)),
    ?assert(meck:validate(utils)),
    ?assert(meck:validate(discovery))
  after
    meck:unload(parsing),
    meck:unload(utils),
    meck:unload(discovery)
  end.
