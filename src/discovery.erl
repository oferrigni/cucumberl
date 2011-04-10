-module(discovery).

-compile(export_all).

run_steps(Modules, ArgList) ->
  lists:foldl(fun(Mod, undefined) -> 
        Mod:step(ArgList);
        (_, Acc) -> Acc
  end,
  undefined, Modules).

all_step_modules() ->
	FilteredModuleInfo = lists:filter(fun({Mod,_})-> [{exports, Names}|_] = Mod:module_info(), lists:any(fun({Elem,_})-> Elem == step end, Names) end, code:all_loaded()),
	lists:sort(lists:map(fun({Mod,_}) -> Mod end, FilteredModuleInfo)).
