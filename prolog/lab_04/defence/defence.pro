domains
name = symbol.
gender = symbol.

predicates
hasGender(name, symbol).
married(name, name).
pred(name, name).
grandpred(name, gender, name, gender).
mother(name, name).
father(name, name).
brother(name, name).
sister(name, name).
mother_in_law(name, name).
father_in_law(name, name).
daughter_in_law(name, name).
son_in_law(name, name).
matchmaker(name, name).
clauses
grandpred(Name, PG, GPName, GPG) :- pred(Y, Name), hasGender(Y, PG), pred(GPName, Y), hasGender(GPName, GPG).

mother(Name, Y) :- pred(Y, Name), hasGender(Y, f), !.
father(Name, Y) :- pred(Y, Name), hasGender(Y, m), !.
brother(Name, Y) :- pred(X, Name), pred(X, Y), Y<>Name, hasGender(Y, m).
sister(Name, Y) :- pred(X, Name), pred(X, Y), Y<>Name, hasGender(Y, f).
married(X, Y) :- pred(X, Child), pred(Y, Child), hasGender(X, XG), hasGender(Y, YG), XG<>YG, !.
mother_in_law(Name, Y) :- married(Name, Partner), pred(Y, Partner), hasGender(Y, f), !.
father_in_law(Name, Y) :- married(Name, Partner), pred(Y, Partner), hasGender(Y, m), !.
daughter_in_law(Name, Y) :- pred(Name, Child), hasGender(Child, m), married(Y, Child).
son_in_law(Name, Y) :- pred(Name, Child), hasGender(Child, f), married(Y, Child).
matchmaker(Name, Y) :- pred(Name, Child), married(Child, X), pred(Y, X).

pred(borr_father, borr).
pred(borr_mother, borr).
pred(bolthorn_f, bestla).
pred(bolthorn, bestla).
pred(borr, odin).
pred(bestla, odin).
pred(borr, odin_m).
pred(bestla, odin_f).
pred(fjorginn, frigg).
pred(fjorgyn, frigg).
pred(odin, thor).
pred(jord, thor).
pred(odin, heimdall).
pred(nine, heimdall).
pred(odin, tyr).
pred(odin, baldr).
pred(frigg, baldr).
pred(odin, hed).
pred(frigg, hed).
pred(farabuti, loki).
pred(laufeya, loki).
pred(loki, fenrir).
pred(loki, hel).
pred(loki, jormungandr).

hasgender(loki, m).
hasgender(odin, m).
hasgender(odin_m, m).
hasgender(odin_f, f).
hasgender(frigg, f).
hasgender(jord, f).
hasgender(fjorginn, m).
hasgender(fjorgyn, f).
hasgender(nine, f).
hasgender(borr, m).
hasgender(borr_father, m).
hasgender(borr_mother, f).
hasgender(bestla, f).
hasgender(bolthorn, m).
hasgender(bolthorn_f, f).
hasgender(buri, m).
hasgender(farabuti, m).
hasgender(laufeya, f).
hasgender(tyr, m).
hasgender(baldr, m).
hasgender(hed, m).
hasgender(hel, f).
hasgender(fenrir, m).
hasgender(jormungandr, m).

goal
%mother(borr, X).
%father(bestla, X).
%brother(odin, X).
%sister(odin, X).
%mother_in_law(bestla, X).
%father_in_law(borr, X).
%married(borr, X).
%daughter_in_law(borr_father, Y).
%son_in_law(bolthorn_f, Y).
%matchmaker(borr_father, Y).

%grandpred(baldr, _, X, f).
%grandpred(baldr, _, X, m).
%grandpred(baldr, _, X, _).
%grandpred(baldr, f, X, f).
%grandpred(baldr, f, X, _).