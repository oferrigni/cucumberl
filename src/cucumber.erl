-module(cucumber).

-compile(export_all).



execute_json(Json, AllStepModules) ->
	Result = parsing:parse_json(Json),
  case (Result) of
		{ok, step_matches, Name, Args} ->
      Matches = discovery:step_matches(AllStepModules, Name),
      case (Matches) of
        ok ->
          ToBeEncoded = [success, [{struct,[{id, list_to_atom(binary:bin_to_list(Name))}, {args, Args}]}]],
          End = mochijson2:encode(ToBeEncoded),
		 	    {ok, End};
        _ -> io:format("Name not found: ~s~n", [Name]), {ok, not_found}
      end;
		{ok, begin_scenario} -> {ok, noreply};
		{ok, begin_scenario, _Tags} -> {ok, noreply};
		{ok, end_scenario} -> {ok, noreply};
		{ok, end_scenario, _Tags} -> {ok, noreply};
    {ok, snippet_text, Keyword, Name} -> 
      ListName = binary:bin_to_list(Name),
      ListKeyword = binary:bin_to_list(Keyword),
      CompleteList = "For " ++ ListKeyword ++ " Please implement step(" ++ ListName  ++  ")\n and step("++ ListName++ ", matches)",
      End = mochijson2:encode([success, list_to_atom(CompleteList)]),
      {ok, End};
		{ok, invoke, Name, _Args} ->	StepAtoms = cucumberl:string_to_atoms(binary:bin_to_list(Name)),
      discovery:run_steps(AllStepModules, StepAtoms);
    {ok, new_line} -> {ok, new_line};
		_ -> undefined
	end.
