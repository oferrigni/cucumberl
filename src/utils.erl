-module(utils).

-compile(export_all).


bitstring_to_atoms(FromList) ->
  cucumberl:string_to_atoms(binary:bin_to_list(FromList)).
