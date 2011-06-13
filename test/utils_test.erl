-module(utils_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).


string_to_atoms_test() ->
    ?assertMatch([], utils:string_to_atoms("")),
    ?assertMatch([a, bb, ccc],
                 utils:string_to_atoms("a bb ccc")),
    ?assertMatch([a, bb, ccc],
                 utils:string_to_atoms("  a  bb   ccc  ")).
