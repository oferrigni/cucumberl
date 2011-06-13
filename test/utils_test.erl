-module(utils_test).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).


string_to_atoms_test() ->
    ?assertMatch([], utils:string_to_atoms("")),
    ?assertMatch([a, bb, ccc],
                 utils:string_to_atoms("a bb ccc")),
    ?assertMatch([a, bb, ccc],
                 utils:string_to_atoms("  a  bb   ccc  ")).

bitstring_to_atom_test() ->
  ?assertMatch('', utils:bitstring_to_atom(<<"">>)),
  ?assertMatch(foo, utils:bitstring_to_atom(<<"foo">>)),
  ?assertMatch('foo-bar', utils:bitstring_to_atom(<<"foo-bar">>)).
