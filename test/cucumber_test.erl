%%%-------------------------------------------------------------------
%%% @author Oliver Ferrigni
%%% @end
%%%-------------------------------------------------------------------

-module(cucumber_test).
-include_lib("eunit/include/eunit.hrl").
-compile(export_all).


execute_json_test() ->
	put(calculator, something),
	?assertEqual(something,get(calculator)),
	Json = "[\"step_matches\",{\"name_to_match\":\"I have cleared the calculator\"}]",
	AllStepModules = discovery:all_step_modules(),
	cucumber:execute_json(Json, AllStepModules),
	?assertEqual([], get(calculator)).
