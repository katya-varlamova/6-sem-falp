domains
 name = string.
 phone = string.
 university = string.
 points = integer.
 
 predicates
 student(name, university).
 tel(name,  phone).
 score(name, points) 
 
 clauses
 tel(ivan, "8-800-555-35-35").
 tel(ivan, "8-800-555-35-36").
 tel(petr, "8-801-555-35-35").
 tel(petr, "8-810-555-35-35").
 tel(valera, "8-800-556-35-35").
 tel(valera, "8-800-556-37-35").
 score(ivan, 180).
 score(ivan, 280).
 score(petr, 250).
 score(valera, 300).
 student(N, mgtu) :- score(N, Y), Y > 200.
 student(N, mgu) :- score(N, Y), Y < 200.
 
 Goal
 tel(X, Y), student(X, mgu).