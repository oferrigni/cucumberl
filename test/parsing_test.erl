-module(parsing_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).


%[A,{_,[B]}] = mochijson2:decode("[\"snippet_text\",{\"step_keyword\":\"Given\",\"multiline_arg_class\":\"\",\"step_name\":\"we're all wired\"}]").


parse_step_matches_test() ->
	InputJson = "[\"step_matches\",{\"name_to_match\":\"we're all
	wired\"}]",
	StepMatches = <<"step_matches">>,
	NameToMatch = <<"name_to_match">>,
	[StepMatches,{struct, [{NameToMatch, Name}]}] = mochijson2:decode(InputJson),
	?assertEqual(<<"we're all\n\twired">>, Name).

parse_begin_scenario_test() ->
	InputJson = "[\"begin_scenario\"]",
	BeginScenario = <<"begin_scenario">>,
	[BeginScenario] = mochijson2:decode(InputJson),
  ?assertEqual(<<"begin_scenario">>, BeginScenario).

