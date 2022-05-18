domains
 name = symbol.
 gender = symbol.
 
predicates
 pred(name, name, gender).
 grandpred(name, gender, name, gender).

 clauses
 grandpred(Name, PG, GPName, GPG) :- pred(Y, Name, PG), pred(GPName, Y, GPG).
 
 pred(satre, nefuns, m).
 pred(satre, tinia, m).
 pred(satre, aita, m).
 
 pred(tinia, menrva, m).
 pred(uni, menrva, f).
 pred(tinia, herkle, m).
 pred(uni, herkle, f).
 pred(tinia, turan, m).
 pred(uni, turan, f).
 pred(turan, turnu, f).
 pred(atunis, turnu, m).
 pred(tinia, aplu, m).
 pred(uni, aplu, f).
 
 pred(tinia, fufluns, m). 
 pred(uni, fufluns, f). %
 
 pred(tinia, turms, m).
 pred(uni, turms, f).
 
 pred(thesan, memnon, f).
 pred(titan, memnon, m).
 
 
 goal
 %grandpred().

