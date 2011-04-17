-module(parsing).

-compile(export_all).
-define(BEGIN_SCENARIO, <<"begin_scenario">>).

parse_json(Json) ->
	Parsed = mochijson2:decode(Json),
	case (Parsed) of 
		[<<"begin_scenario">>] -> {ok, begin_scenario};
		[_] -> {ok, undefined}
  end.
