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
        _ -> io:format("Name not found: ~s~n", [Name]), {undefined}
      end;
		{ok, begin_scenario} -> {ok, noreply};
		{ok, end_scenario} -> {ok, noreply};
		{ok, invoke, Name, _Args} ->	StepAtoms = cucumberl:string_to_atoms(binary:bin_to_list(Name)),
      discovery:run_steps(AllStepModules, StepAtoms);
		_ -> undefined
	end.
