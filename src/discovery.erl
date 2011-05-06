-module(discovery).

-compile(export_all).
-include_lib("kernel/include/file.hrl").

run_steps(Modules, ArgList) ->
  lists:foldl(fun(Mod, undefined) -> 
        Mod:step(ArgList);
        (_, Acc) -> Acc
  end,
  undefined, Modules).

all_step_modules() ->
	FilteredModuleInfo = lists:filter(fun({Mod,_})-> [{exports, Names}|_] = Mod:module_info(), lists:any(fun({Elem,_})-> Elem == step end, Names) end, code:all_loaded()),
	lists:sort(lists:map(fun({Mod,_}) -> Mod end, FilteredModuleInfo)).

all_feature_files(Directory) ->
{ok, UnfilteredFeatureFiles} = file:list_dir(Directory),
lists:sort(lists:filter(
	fun(File) ->
			{ok,FileInfo} = file:read_file_info(Directory++File),
			case FileInfo#file_info.type of
				regular -> true;
				_ -> false
			end
	end,
	UnfilteredFeatureFiles)).

step_matches(Modules, ArgList) ->
  Atoms = cucumberl:string_to_atoms(binary:bin_to_list(ArgList)),
  lists:foldl(fun(Mod, undefined) -> 
        Mod:step(Atoms, matches);
        (_, Acc) -> Acc
  end,
  undefined, Modules).
