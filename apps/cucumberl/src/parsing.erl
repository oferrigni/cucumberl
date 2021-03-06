-module(parsing).

-compile(export_all).
-define(BEGIN_SCENARIO, <<"begin_scenario">>).
-define(END_SCENARIO, <<"end_scenario">>).
-define(STEP_MATCHES,<<"step_matches">>).
-define(NAME_TO_MATCH, <<"name_to_match">>).
-define(INVOKE, <<"invoke">>).
-define(ID, <<"id">>).
-define(ARGS, <<"args">>).
-define(SNIPPET_TEXT, <<"snippet_text">>).
-define(MULTILINE_ARG_CLASS, <<"multiline_arg_class">>).
-define(STEP_NAME, <<"step_name">>).
-define(STEP_KEYWORD, <<"step_keyword">>).
-define(TAGS, <<"tags">>).

parse_json(Json) ->
  try
	Parsed = mochijson2:decode(Json),
	case (Parsed) of 
		[?BEGIN_SCENARIO] -> {ok, begin_scenario};
    [?BEGIN_SCENARIO, {struct, [{?TAGS, Tags}]}] -> {ok, begin_scenario, Tags};
		[?END_SCENARIO] -> {ok, end_scenario};
    [?END_SCENARIO, {struct, [{?TAGS, Tags}]}] -> {ok, end_scenario, Tags};
		[?STEP_MATCHES, {struct, [{?NAME_TO_MATCH, Name}]}] -> {ok,
				step_matches, Name, []};
    [?INVOKE, {struct, [{?ID, Name}, {?ARGS, Args}]}] -> {ok, invoke, Name, Args};
    [?SNIPPET_TEXT, {struct, [{?STEP_KEYWORD, Keyword}, {?STEP_NAME, Name}, {?MULTILINE_ARG_CLASS, _}]}] ->
      {ok, snippet_text, Keyword, Name};
    _ -> io:format("Encountered unknown json ~s ~n", [Parsed]), {ok, undefined}
  end
  catch
   error:_Reason ->
     {ok, new_line}
 end. 
