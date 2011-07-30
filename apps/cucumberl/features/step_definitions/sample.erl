-module(sample).

-compile(export_all).

% Step definitions for the sample calculator Addition feature.

step([i, have, entered, N, into, the, calculator]) ->
    enter(list_to_integer(atom_to_list(N)));

step([i, press, Op]) ->
    press(Op);

step([the, result, should, be, Result, on, the, screen]) ->
  case ([list_to_integer(atom_to_list(Result))] =:= get(calculator)) of
    true -> {ok, noreply};
    false -> undefined
  end;

step(_) -> undefined.

step([i, have, entered, _N, into, the, calculator], matches) -> ok;
step([i, press, _Op], matches) -> ok;
step([the, result, should, be, _Result, on, the, screen], matches) -> ok;
step(_,matches) -> undefined.
% Implementing a simple model here...

enter(N) ->
    put(calculator, [N | get(calculator)]),
    {ok, noreply}.

press(Op) ->
	try 
		Result = apply(?MODULE, Op, get(calculator)),
		put(calculator, [Result]),
    {ok, noreply}
	catch
			error:_Reason -> undefined
	end.

add(X, Y) ->
    X + Y.


