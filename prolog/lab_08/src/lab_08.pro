domains
	list = integer*

predicates
	bigger(list, integer, list)
	odd_list(list, list)
	set(list, list)
	rm_all(list, integer, list)
	rm_one(list, integer, list)

clauses
	bigger([Head | Tail], N, [Head | ResTail]) :- Head > N, !, bigger(Tail, N, ResTail).
	bigger([_ | Tail], N, Result) :- bigger(Tail, N, Result).
	bigger([], _, []).
	
	odd_list([_, Head | Tail], [Head | ResTail]) :- odd_list(Tail, ResTail).
	odd_list([], []) :- !.
	
	rm_one([Head | Tail], N, Tail) :- Head = N, !.
	rm_one([Head | Tail], N, [Head | ResList]) :- !, rm_one(Tail, N, ResList).
	rm_one([], _, []).
	
	rm_all([Head | Tail], N, [Head | ResList]) :- Head <> N, !, rm_all(Tail, N, ResList).
	rm_all([_ | Tail], N, ResList) :- rm_all(Tail, N, ResList), !.
	rm_all([], _, []).
	
	set([Head | Tail], [Head | Result]) :- rm_all(Tail, Head, Nt), !, set(Nt, Result).
	set([], []).

goal
	%bigger([1, 7, 3, 4, 5, 6, 2], 3, Result).
	%odd_list([1, 2, 3, 4, 5, 6, 7, 8], Result).
	
	%rm_one([1, 2, 3, 1, 2, 3, 1, 2, 3], 3, Result).
	%rm_all([1, 2, 3, 1, 2, 3, 1, 2, 3], 1, Result).
	
	%set([1, 2, 3, 1, 2, 3, 1, 2, 3], Result).