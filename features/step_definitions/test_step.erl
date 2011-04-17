-module(test_step).

-compile(export_all).

step([given,some,stuff]) ->
  false;
step(_)->
  undefined.
