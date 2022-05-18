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
 married(X, Y) :- hasGender(X, XG), hasGender(Y, YG), XG<>YG, pred(X, Child), pred(Y, Child).
 mother_in_law(Name, Y) :- married(Name, Partner), pred(Y, Partner), hasGender(Y, f), !.
 father_in_law(Name, Y) :- married(Name, Partner), pred(Y, Partner), hasGender(Y, m), !.
 daughter_in_law(Name, Y) :- pred(Name, Child), hasGender(Child, m), married(Y, Child).
 son_in_law(Name, Y) :- pred(Name, Child), hasGender(Child, f), married(Y, Child).
 matchmaker(Name, Y) :- pred(Name, Child), married(Child, X), pred(Y, X).
 
 pred(satre, nefuns).
 pred(satre, tinia).
 pred(satre, aita).
 
 pred(tinia, menrva).
 pred(uni, menrva).
 pred(tinia, herkle).
 pred(uni, herkle).
 pred(tinia, turan).
 pred(turan, turnu).
 pred(atunis, turnu).
 pred(tinia, aplu).
 
 pred(tinia, fufluns).
 pred(semla, fufluns).
 
 pred(tinia, turms).
 
 pred(thesan, memnon).
 pred(titan, memnon).
 
 hasGender(satre, m).
 hasGender(aita, m).
 hasGender(tinia, m).
 hasGender(uni, f).
 hasGender(menrva, f).
 hasGender(herkle, m).
 hasGender(turan, f).
 hasGender(turnu, m).
 hasGender(atunis, m).
 
 hasGender(thesan, f).
 hasGender(titan, m).
 hasGender(memnon, m).
 hasGender(aplu, m).
 hasGender(fufluns, m).
 hasGender(turms, m).
 
 goal
 %mother(menrva, X).
 %father(herkle, X).
 %brother(menrva, X).
 %sister(herkle, X).
 %married(tinia, X).
