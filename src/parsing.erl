-module(parsing).

-compile(export_all).
-define(BEGIN_SCENARIO, <<"begin_scenario">>).
-define(STEP_MATCHES,<<"step_matches">>).
-define(NAME_TO_MATCH, <<"name_to_match">>).

parse_json(Json) ->
	Parsed = mochijson2:decode(Json),
	case (Parsed) of 
		[<<"begin_scenario">>] -> {ok, begin_scenario};
		[?STEP_MATCHES, {struct, [{?NAME_TO_MATCH, Name}]}] -> {ok,
				step_matches, Name, []};
		_ -> {ok, undefined}
  end.
