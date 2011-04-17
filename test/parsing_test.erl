-module(parsing_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).


%[A,{_,[B]}] = mochijson2:decode("[\"snippet_text\",{\"step_keyword\":\"Given\",\"multiline_arg_class\":\"\",\"step_name\":\"we're all wired\"}]").


parse_step_matches_test() ->
	InputJson = "[\"step_matches\",{\"name_to_match\":\"we're all\n\twired\"}]",
	{ok, step_matches, Name, Args} = parsing:parse_json(InputJson),
	?assertEqual(<<"we're all\n\twired">>, Name),
	?assertEqual([], Args).

parse_begin_scenario_test() ->
	InputJson = "[\"begin_scenario\"]",
	{ok, begin_scenario} = parsing:parse_json(InputJson).

parse_end_scenario_test() ->
	InputJson ="[\"end_scenario\"]\n",
	{ok, end_scenario} = parsing:parse_json(InputJson).


parse_unknown_test() ->
	InputJson = "[\"foo\"]",
	{ok, undefined} = parsing:parse_json(InputJson).
