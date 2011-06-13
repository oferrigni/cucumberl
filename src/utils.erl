-module(utils).

-compile(export_all).


bitstring_to_atoms(FromList) ->
  string_to_atoms(binary:bin_to_list(FromList)).


string_to_atoms(StrWords) ->
    lists:map(fun (Y) -> list_to_atom(string:to_lower(Y)) end,
              string:tokens(StrWords, " ")).
