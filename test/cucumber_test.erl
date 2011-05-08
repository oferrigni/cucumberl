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
