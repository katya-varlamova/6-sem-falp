domains
name, phone, univer, color, bankName, city, street, house, flat = string.
amount, price = integer.
address = address(city, street, house, flat).
object = building(name, price);
	 region(name, price);
	 water_transport(name, color, price);
	 car(name, color, price).

predicates
tel(name, phone, address).
deposit(name, bankName, amount).
owner(name, object).

all_objects(name, name).
all_objects_price(name, name, price).
clauses

all_objects(Surname, Name) :- owner(Surname, car(Name, _, _)).
all_objects(Surname, Name) :- owner(Surname, building(Name, _)).
all_objects(Surname, Name) :- owner(Surname, region(Name, _)).
all_objects(Surname, Name) :- owner(Surname, water_transport(Name, _, _)).

all_objects_price(Surname, Name, Price) :- owner(Surname, car(Name, _, Price)).
all_objects_price(Surname, Name, Price) :- owner(Surname, building(Name, Price)).
all_objects_price(Surname, Name, Price) :- owner(Surname, region(Name, Price)).
all_objects_price(Surname, Name, Price) :- owner(Surname, water_transport(Name, _, Price)).


owner("denis", car("BMW", "Green", 1000)).
owner("egor", region("Nothung", 0)).
owner("darya", building("Moscow-city", 100500)).
owner("valera", car("BMW", "green", 1000)).
owner("anton", region("Krasnogorsk", 10000)).
owner("denis", building("Mail.ru Office", 20000)).
owner("egor", water_transport("Yacht", "Red", 10000)).
owner("darya", car("Cadillac", "Black", 304000)).
owner("anton", building("BMSTU", 200000)).
owner("valera", car("Mercedes", "White", 30000)).
owner("denis", building("Tree", 10)).

tel("anton", "812314214", address("moscow", "olenevaya", "12", "4")).
tel("egor", "814314214", address("moscow", "olenevaya2", "12", "4")).
tel("denis", "815314214", address("moscow", "olenevaya3", "12", "4")).
tel("darya", "815314214", address("moscow", "olenevaya3", "12", "4")).
tel("darya", "817314214", address("moscow", "olenevaya", "13", "4")).
tel("valera", "816314214", address("moscow", "olenevaya2", "16", "4")).

deposit("egor", "sber", 1000).
deposit("anton", "tinkoff", 20000).
deposit("denis", "raif", 100000).
deposit("valera", "sber", 10000).
goal
all_objects("denis", X);
all_objects_price("denis", X, Y).
