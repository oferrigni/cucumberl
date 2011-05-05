-module(test_step).

-compile(export_all).

step([given,some,stuff]) ->
  false;
step(_) ->
  undefined.
step(_,matches) -> undefined;

step(_,_)->
  undefined.
