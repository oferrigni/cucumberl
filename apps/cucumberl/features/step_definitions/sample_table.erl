-module(sample_table).

-compile(export_all).

% Step definitions for the sample calculator Multiplication feature.

step([i,have,cleared,the,calculator]) ->
    put(calculator, []),
    {ok,noreply};

step([i, press, multiply]) ->
	[X,Y] = get(calculator),
	Result = X * Y,
	put(calculator, [Result]),
  {ok,noreply};

step(_) -> undefined.
step([i,have,cleared,the,calculator], matches) -> ok;
step([i, press, multiply], matches) -> ok;
step(_,matches) -> undefined.

