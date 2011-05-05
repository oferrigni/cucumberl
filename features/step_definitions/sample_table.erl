-module(sample_table).

-compile(export_all).

% Step definitions for the sample calculator Multiplication feature.

step([i,have,cleared,the,calculator]) ->
    put(calculator, []),
    ok;

step([i, press, multiply]) ->
	[X,Y] = get(calculator),
	Result = X * Y,
	put(calculator, [Result]),
	Result;

step(_) -> undefined.
step([i,have,cleared,the,calculator], matches) -> ok;
step([i, press, multiply], matches) -> ok;
step(_,matches) -> undefined.

% A main() to kick it all off...

main() ->
    StepDefinitionModules = [sample_table, sample_more, sample],
    put(calculator, []),
    cucumberl:run("./features/sample_table.feature",
                  StepDefinitionModules).

