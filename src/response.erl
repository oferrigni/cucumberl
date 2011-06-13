-module(response).


-export([matches/2, snippet/1]).

matches(Name, Args) ->
   ToBeEncoded = [success, [{struct,[{id, utils:bitstring_to_atom(Name)}, {args, Args}]}]],
   mochijson2:encode(ToBeEncoded).

snippet(Name) ->
      ListName = binary:bin_to_list(Name),
      CucumberAtoms = utils:string_to_atoms(ListName),
      JoinedAtoms = string:join(lists:map(fun(Elem) -> atom_to_list(Elem) end, CucumberAtoms), ","),
      CompleteList = "step(" ++ JoinedAtoms  ++  ")\nstep("++ JoinedAtoms ++ ", matches)->ok;",
      mochijson2:encode([success, list_to_atom(CompleteList)]).
