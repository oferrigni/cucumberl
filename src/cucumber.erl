-module(cucumber).

-compile(export_all).



execute_json(Json, AllStepModules) ->
	{ok, step_matches, Name, Args} = parsing:parse_json(Json),
	StepAtoms = cucumberl:string_to_atoms(binary:bin_to_list(Name)),
	discovery:run_steps(AllStepModules, StepAtoms).
