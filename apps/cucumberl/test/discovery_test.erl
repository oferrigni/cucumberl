-module(discovery_test).
-include_lib("eunit/include/eunit.hrl").

-compile(export_all).

find_a_module_test() ->
  LoadedModules = code:all_loaded(),
  ?assert(lists:any(fun({Mod,_}) -> Mod == discovery_test end, LoadedModules)),
  true.

find_a_step_test() ->
  ?assert(lists:any(fun({Mod,_})-> [{exports, Names}|_] = Mod:module_info(), lists:any(fun({Elem,_})-> Elem == step end, Names) end, code:all_loaded())).

apply_a_step_test() ->
  ?assertNot(apply(test_step, step,[[given,some,stuff]])).

find_a_specific_step_test() ->
  ArgList = [given,some,stuff],
  ?assertEqual(false ,discovery:run_steps(discovery:all_step_modules(), ArgList)),
  true.

find_all_modules_test() ->
  StepModules = lists:sort([sample,sample_more,sample_table,test_step]),
  ?assertEqual(StepModules, discovery:all_step_modules()).

find_all_feature_files_test() ->
  FeatureFiles = discovery:all_feature_files("../features/"),
  ExpectedFeatureFiles = lists:sort(["sample.feature","sample_more.feature","sample_table.feature","wire_protocol.feature"]),
  ?assertEqual(ExpectedFeatureFiles, FeatureFiles).

step_matches_when_doesnt_exist_test() ->
  ArgList = <<"[other,stuff]">>,
  Result = discovery:step_matches(discovery:all_step_modules(), ArgList),
  ?assertEqual(undefined, Result).

step_matches_when_does_exist_test() ->
  ArgList = <<"[other,stuff]">>,
  Result = discovery:step_matches(discovery:all_step_modules(), ArgList),
  ?assertEqual(undefined, Result).

step_matches_with_variable_test() ->
  _ThirdArg = <<"i press Op">>,
  SecondArg = <<"i have entered 50 into the calculator">>,
  FourthArg = <<"I have entered 50 into the calculator">>,
  ThirdArg =  <<"I have entered 50 into the calculator">>,
  _ArgList = <<"[given,i,have,entered,_N,into,the,calculator]">>,
  Result = discovery:step_matches(discovery:all_step_modules(),ThirdArg),
  ?assertEqual(ok, Result).


