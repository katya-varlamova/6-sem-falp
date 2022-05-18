domains
 	list = integer*
 
 predicates
 
 	first(list, list)
 	
 	rec_length(integer, integer, list)
 	length(integer, list)
 	len_div_2(integer, integer)
 	halfs(list, integer, list, list)
 	merge_halfs(list, list, list)
 	second(list, list)
 	
 	rev_rec(list, list, list).
 	reverse(list, list).
 	third(list, list).
 	
 clauses
 	first([A], [A]).
 	first([], []).
 	first([A, B | Tail], [B, A | Res]) :- first(Tail, Res).
 	
 	
 	rec_length(Res, Len, [_ | Tail]) :- NewLen = Len + 1, rec_length(Res, NewLen, Tail).
 	rec_length(Res, Len, []) :- Res = Len, !.
 	length(Res, List) :- rec_length(Res, 0, List).
 	
 	len_div_2(Len, Res) :- Res = Len / 2.
 
 	halfs(Tail, 0, [], Tail) :- !.
 	halfs([Head | Tail], Counter, [Head | Res], T) :- Counter > 0, NewCounter = Counter - 1, halfs(Tail, NewCounter, Res, T).
 
 	merge_halfs([], H, H).
 	merge_halfs([Head | Tail], H, [Head | Res]) :- merge_halfs(Tail, H, Res).
 	
 	second(L, Res) :- length(Len, L), 
			 len_div_2(Len, Len_d), 
			 halfs(L, Len_d, Head, Tail),
			 merge_halfs(Tail, Head, Res).
 	
 	
 	rev_rec([], A, A).
 	rev_rec([H | T], Acc, X) :- rev_rec(T, [H | Acc], X).
 	reverse(L, R) :- rev_rec(L, [], R).
 	third(L, Res) :- length(Len, L), len_div_2(Len, Len_d), halfs(L, Len_d, Head, Tail), reverse(Head, RevHead), merge_halfs(Tail, RevHead, Res).
 goal
 	first([1, 2, 3, 4, 5, 6, 7], Res1), second([1, 2, 3, 4, 5, 6, 7], Res2), third([1, 2, 3, 4, 5, 6, 7], Res3).