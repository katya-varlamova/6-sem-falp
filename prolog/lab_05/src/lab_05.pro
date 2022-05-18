domains
  num = integer

predicates
  max2(num, num, num)
  max3(num, num, num, num)

  max2clipping(num, num, num)
  max3clipping(num, num, num, num)

clauses
  max2(N1, N2, N2) :- N2 >= N1.
  max2(N1, N2, N1) :- N1 >= N2.

  max3(N1, N2, N3, N3) :- N3 >= N1, N3 >= N2.
  max3(N1, N2, N3, N2) :- N2 >= N1, N2 >= N3.
  max3(N1, N2, N3, N1) :- N1 >= N2, N1 >= N3.

  max2clipping(N1, N2, N2) :- N2 >= N1, !.
  max2clipping(N1, _, N1).

  max3clipping(N1, N2, N3, N3) :- N3 >= N2, N3 >= N1, !.
  max3clipping(N1, N2, _, N2) :- N2 >= N1, !.
  max3clipping(N1, _, _, N1).

goal
  %max2(1, 2, Max).
  %max3(1, 3, 2, Max).
  %max2clipping(1, 4, Max).
  max3clipping(1, 3, 3, Max).