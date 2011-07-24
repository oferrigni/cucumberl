-module(cucumber).

-compile(export_all).



execute_json(Json, AllStepModules) ->
	Result = parsing:parse_json(Json),
  case (Result) of
		{ok, step_matches, Name, Args} ->
      Matches = discovery:step_matches(AllStepModules, Name),
      case (Matches) of
        ok ->
          End = response:matches(Name, Args),
		 	    {ok, End};
        _ -> %io:format("Name not found: ~s~n", [Name]),
          {ok, not_found}
      end;
		{ok, begin_scenario} -> {ok, noreply};
		{ok, begin_scenario, _Tags} -> {ok, noreply};
		{ok, end_scenario} -> {ok, noreply};
		{ok, end_scenario, _Tags} -> {ok, noreply};
    {ok, snippet_text, _Keyword, Name} -> 
      End = response:snippet(Name),
      {ok, End};
		{ok, invoke, Name, _Args} ->	StepAtoms = utils:bitstring_to_atoms(Name),
      discovery:run_steps(AllStepModules, StepAtoms);
    {ok, new_line} -> {ok, new_line};
		_ -> undefined
	end.

