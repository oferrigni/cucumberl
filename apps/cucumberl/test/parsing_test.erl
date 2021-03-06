-module(parsing_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).


%[A,{_,[B]}] = mochijson2:decode("[\"snippet_text\",{\"step_keyword\":\"Given\",\"multiline_arg_class\":\"\",\"step_name\":\"we're all wired\"}]").


parse_step_matches_test() ->
	InputJson = "[\"step_matches\",{\"name_to_match\":\"we're all\n\twired\"}]",
	{ok, step_matches, Name, Args} = parsing:parse_json(InputJson),
	?assertEqual(<<"we're all\n\twired">>, Name),
	?assertEqual([], Args).

parse_step_matches_with_variable_test() ->
  InputJson = "[\"step_matches\",{\"name_to_match\":\"I have entered 50 into the calculator\"}]",
	{ok, step_matches, Name, Args} = parsing:parse_json(InputJson),
	?assertEqual(<<"I have entered 50 into the calculator">>, Name),
	?assertEqual([], Args).

parse_begin_scenario_test() ->
	InputJson = "[\"begin_scenario\"]",
	{ok, begin_scenario} = parsing:parse_json(InputJson).

parse_begin_scenario_with_tags_test() ->
	InputJson = "[\"begin_scenario\",{\"tags\":[\"wire\"]}]",
  {ok, begin_scenario, Tags} = parsing:parse_json(InputJson),
  ?assertEqual([<<"wire">>], Tags).

parse_end_scenario_with_tags_test() ->
	InputJson =  "[\"end_scenario\",{\"tags\":[\"wire\"]}]",
  {ok, end_scenario, Tags} = parsing:parse_json(InputJson),
  ?assertEqual([<<"wire">>], Tags).

parse_end_scenario_test() ->
	InputJson ="[\"end_scenario\"]\n",
	{ok, end_scenario} = parsing:parse_json(InputJson).


parse_unknown_test() ->
	InputJson = "[\"foo\"]",
	{ok, undefined} = parsing:parse_json(InputJson).

parse_begin_scenario_with_tags() ->
	InputJson = "[\"begin_scenario\",{\"tags\":[\"wire\"]}]\n" ,
	{ok, begin_scenario} = parsing:parse_json(InputJson).

parse_new_line_only_test() ->
	InputJson = "\n" ,
	{ok, new_line} = parsing:parse_json(InputJson).

parse_invoke_with_args_test() ->
  InputJson = "[\"invoke\",{\"id\":\"I have cleared the calculator\",\"args\":[]}]\n",
  {ok, invoke, Name, Args} = parsing:parse_json(InputJson),
  ?assertEqual(<<"I have cleared the calculator">>, Name),
  ?assertEqual([], Args).

parse_snippet_text_with_args_test() ->
  InputJson = "[\"snippet_text\",{\"step_keyword\":\"Given\",\"step_name\":\"I have entered 50 into the calculator\",\"multiline_arg_class\":\"\"}]",
  {ok, snippet_text, Keyword, Name} = parsing:parse_json(InputJson),
  ?assertEqual(<<"I have entered 50 into the calculator">>, Name),
  ?assertEqual(<<"Given">>, Keyword).
