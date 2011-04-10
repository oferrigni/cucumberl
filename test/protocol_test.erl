-module(protocol_test).
-include_lib("eunit/include/eunit.hrl").

-compile(export_all).


handle_begin_scenario_test() ->
	BeginScenarioSnippet = "[\"begin_scenario\",{\"tags\":[\"wire\"]}]\n",
	RetVal = case re:run(BeginScenarioSnippet,
			"\\[\"begin_scenario\",(.*)", [{capture, [1], list}]) of
			{match, Captured} ->
				Captured;
			{nomatch} ->
				false
		end,
	?assertEqual(["{\"tags\":[\"wire\"]}]"], RetVal).
