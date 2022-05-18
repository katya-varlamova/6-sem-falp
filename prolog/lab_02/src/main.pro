domains
name, phone, univer = symbol.
model, color = symbol.
bankName = symbol.
amount, price = integer.
city, street, house, flat = symbol.
address = address(city, street, house, flat).

predicates

tel(name, phone, address).
car(name, model, color, price).
deposit(name, bankName, amount).
fs(name, model, price, phone).

clauses

%fs(Name, Model, Price, Phone):- tel(Name, Phone, _), car(Name, Model, _, Price).
%ss(Name, City, Street, Banks, Phone):- tel(Name, Phone, address(City, Street, _, _)), deposit(Name, Banks, _).

tel(anton, "812314214", address("moscow", "olenevaya", "12", "4")).
tel(egor, "814314214", address("moscow", "olenevaya2", "12", "4")).
tel(darya, "817314214", address("moscow", "olenevaya", "13", "4")).
tel(valera, "816314214", address("moscow", "olenevaya2", "16", "4")).
tel(denis, "815314214", address("moscow", "olenevaya3", "12", "4")).

car(anton, "x6", "red", 10000000).
car(darya, "x1", "yellow", 15000000).
car(denis, "juke", "red", 15000000).

deposit(egor, "sber", 1000).
deposit(anton, "tinkoff", 20000).
deposit(denis, "raif", 100000).
deposit(valera, "sber", 10000).

goal
%fs(X, Y, Z, "815314214").

%fs(_, Y, _, "815314214").

%ss(egor, "moscow", X, Y, Z).