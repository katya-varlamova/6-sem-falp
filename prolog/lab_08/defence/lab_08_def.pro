domains
  	version = symbol
  	name = symbol
  	package = package(name, version)
  	list = package*
  	listlist = list *
  predicates
  	dep(package, list)
  	tree_to_list(list, list)
  	merge(list, list, list)
  	find_conflict_help(list, package, package)
  	find_conflict_help2(list, list)
  	append(package, list, list)
  	find_conflicts(package, package)
  	find_conflicts_wrap(package)
  	not_empty(list)
  	find_with_no_conflicts(package, list)
  	find_with_no_conflicts_wrap(list)
  	empty(list)
  	set(list, list)
  	rm_all(list, package, list)
  	not_eq_packages(package, package)
  	rec_length(integer, integer, list)
 	length(integer, list)
 	find_with_no_conflicts_max(list).
 	find_with_no_conflicts_maxlen(listlist, integer, list, integer, list).
  clauses
  	dep(package("pac1", "v1"), [package("pac2", "v1"), package("pac3", "v1")] ).
  	dep(package("pac2", "v1"), [package("pac4", "v1"), package("pac5", "v1")] ).
  	dep(package("pac3", "v1"), [package("pac4", "v1"), package("pac5", "v2")]).
  	dep(package("pac4", "v1"), [package("pac7", "v1")] ).
  	dep(package("pac4", "v2"), [] ).
  	dep(package("pac5", "v1"), [package("pac4", "v2")]).
  	dep(package("pac5", "v2"), [package("pac4", "v1"),package("pac6", "v1")]).
	dep(package("pac6", "v1"), [] ).
	dep(package("pac7", "v1"), [] ).
	
	rec_length(Res, Len, [_ | Tail]) :- NewLen = Len + 1, rec_length(Res, NewLen, Tail).
 	rec_length(Res, Len, []) :- Res = Len, !.
 	length(Res, List) :- rec_length(Res, 0, List).
  	
  	not_eq_packages(package(_, V1), package(_, V2)) :- V1 <> V2, !.
  	not_eq_packages(package(N1, _), package(N2, _)) :- N1 <> N2, !.
  	rm_all([Head | Tail], N, [Head | ResList]) :- not_eq_packages(Head, N), !, rm_all(Tail, N, ResList).
 	rm_all([_ | Tail], N, ResList) :- rm_all(Tail, N, ResList), !.
 	rm_all([], _, []).
 	
	set([Head | Tail], [Head | Result]) :- rm_all(Tail, Head, Nt), !, set(Nt, Result).
 	set([], []).
 	
  	merge([], L2, L2).
  	merge([Head | Tail], L2, [Head | Res]) :- merge(Tail, L2, Res).
  	
  	tree_to_list([], []).
  	tree_to_list([Package | TailPackages], [Package | Res]) :- dep(Package, Deps), 
  								   merge(TailPackages, Deps, ResPackages), 
  								   tree_to_list(ResPackages, Res).
  								   						   
  	find_conflict_help([package(HeadName, _) | Tail], package(Name, Version), Res) :- HeadName <> Name, 
  	                                                                                  find_conflict_help(Tail, package(Name, Version), Res).
  	find_conflict_help([package(HeadName, HeadVersion) | Tail], package(Name, Version), Res) :- HeadName = Name, 
  	                                                                                            HeadVersion = Version,
  	                                                                                            find_conflict_help(Tail, package(Name, Version), Res).
  	find_conflict_help([package(HeadName, HeadVersion) | _], package(Name, Version), Res) :- HeadName = Name, 
  	                                                                                         HeadVersion <> Version, 
  	                                                                                         Res = package(Name, Version),
  	                                                                                         !.
  	append(El, List, [El | List]). 
  	find_conflict_help2([], []).
  	find_conflict_help2([Head | Tail], Res) :- find_conflict_help2(Tail, Res1), find_conflict_help(Tail, Head, R), append(R, Res1, Res).
  	find_conflict_help2([Head | Tail], Res) :- find_conflict_help2(Tail, Res), !.
  	
  	not_empty([_ | Tail]).
  	find_conflicts(P, P) :- tree_to_list([P], List), find_conflict_help2(List, R), not_empty(R).
  	find_conflicts_wrap(Res) :- dep(P, _), find_conflicts(P, Res).
  	
  	empty([]).
  	find_with_no_conflicts(P,  Res) :- tree_to_list([P], List), find_conflict_help2(List, R), empty(R), set([P | List], Res).  
  	find_with_no_conflicts_wrap(Res) :- dep(P, _), find_with_no_conflicts(P, Res).
  	
  	find_with_no_conflicts_maxlen([], CurLen, CurEl, CurLen, CurEl).
  	find_with_no_conflicts_maxlen([HL | Tail], CurLen, CurEl, MaxLen, MaxEl) :- length(Len, HL), 
  										    Len > CurLen, 
  										    NewCurLen = Len,
  										    NewCurEl = HL,
  										    find_with_no_conflicts_maxlen(Tail, 
  										                                  NewCurLen,
  										                                  NewCurEl,
  										                                  MaxLen,
  										                                  MaxEl).
  	find_with_no_conflicts_maxlen([HL | Tail], CurLen, CurEl, MaxLen, MaxEl) :- length(Len, HL), 
  										    Len <= CurLen, 
  										    find_with_no_conflicts_maxlen(Tail, 
  										                                  CurLen,
  										                                  CurEl,
  										                                  MaxLen,
  										                                  MaxEl).		
  										                                  
  	find_with_no_conflicts_max(MaxEl) :- findall(R, find_with_no_conflicts_wrap(R), RL), find_with_no_conflicts_maxlen(RL, 
  	    														   -1,
  	    														    _,
  	    														    _,
  	    														    MaxEl).                                                                     	
  goal
  	%find_conflicts_wrap(Res).
  	find_with_no_conflicts_max(Max); find_with_no_conflicts_wrap(Res).