-module(sample_more).

-compile(export_all).

% Step definitions for the sample calculator Multiplication feature.
step(_,matches) -> undefined.

step(_) -> undefined.

% A main() to kick it all off...

main() ->
    Modules = [sample_more, sample],
    put(calculator, []),
    cucumberl:run("./features/sample_more.feature", Modules),
    put(calculator, []),
    cucumberl:run("./features/sample.feature", Modules).

