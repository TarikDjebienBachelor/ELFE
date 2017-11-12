% Question 10

% employe(Nom,Age,Sexe,Entree,Entreprise,Echelon)

employe(jean,23,homme,2000,ibm,1).
employe(jacques,32,homme,1991,bull,4).
employe(anne,45,femme,1993,bull,3).

% Question 13

employe(fabienne, 30, femme, 2002, xerox, 1).
employe(eric,     49, homme, 1984, bull,  5).
employe(marc,     25, homme, 2000, xerox, 2).
employe(julie,    24, femme, 2001, ibm,   1).
employe(sonia,    35, femme, 1996, ibm,   3).
employe(franck,   45, homme, 1999, ibm,   2).
employe(odette,   40, femme, 1994, bull,  4).


% salaire(Entreprise,Echelon,Salaire).

salaire(ibm,1,2000).
salaire(ibm,2,3000).
salaire(ibm,3,4500).
salaire(ibm,4,5500).
salaire(ibm,5,7500).

salaire(bull,1,1600).
salaire(bull,2,3000).
salaire(bull,3,4500).
salaire(bull,4,6000).
salaire(bull,5,7500).

salaire(xerox,1,2500).
salaire(xerox,2,4500).
salaire(xerox,3,5500).
salaire(xerox,4,6000).
salaire(xerox,5,7000).

% Question 11

% ?- employe(X,_,_,_,bull,_).
% X = jacques ;
% X = anne.

% Question 12

% ?- employe(jacques,_,_,_,X,Y),salaire(X,Y,Salaire).
% X = bull,
% Y = 4,
% Salaire = 6000 ;
% fail.




% Question 14

% 1.

% ?- employe(X,Y,Z,T,ibm,E).

% X = jean,
% Y = 23,
% Z = homme,
% T = 2000,
% E = 1 ;

% X = julie,
% Y = 24,
% Z = femme,
% T = 2001,
% E = 1 ;

% X = sonia,
% Y = 35,
% Z = femme,
% T = 1996,
% E = 3 ;

% X = franck,
% Y = 45,
% Z = homme,
% T = 1999,
% E = 2 ;

% fail.

% 2.

% ?-  employe(Nom,Age,femme,_,_,_).
% Nom = anne,
% Age = 45 ;
% Nom = fabienne,
% Age = 30 ;
% Nom = julie,
% Age = 24 ;
% Nom = sonia,
% Age = 35 ;
% Nom = odette,
% Age = 40.

% 3.

% ?- salaire(ibm,Echelon,Salaire).
% Echelon = 1,
% Salaire = 2000 ;
% Echelon = 2,
% Salaire = 3000 ;
% Echelon = 3,
% Salaire = 4500 ;
% Echelon = 4,
% Salaire = 5500 ;
% Echelon = 5,
% Salaire = 7500.

% 4.

% ?- employe(Nom,Age,homme,_,_,_),Age=<25.
% Nom = jean,
% Age = 23 ;
% Nom = marc,
% Age = 25 ;
% fail.

% 5.

% Question 15

jeune_employe(Nom,Entreprise):-employe(Nom,Age,_,_,Entreprise,_),Age=<25.

% 1.
% ?- jeune_employe(marc,xerox).
% true.

% 2.
% ?- jeune_employe(jacques,_).
% fail.

% 3.
% ?- jeune_employe(X,ibm).
% X = jean ;
% X = julie ;
% fail.

% Question 16

cadre(Nom):-employe(Nom,_,_,_,_,3).

% ?- cadre(anne).
% true.

% Question 17

collegues(Nom1,Nom2):-employe(Nom1,_,_,_,X,_),employe(Nom2,_,_,_,X,_).

% ?- collegues(jacques,anne).
% true.

% Question 18

gagne_plus_que(Nom1,Nom2):-employe(Nom1,_,_,_,X,Y),employe(Nom2,_,_,_,Z,T),salaire(X,Y,Salaire1),salaire(Z,T,Salaire2),Salaire1>Salaire2.

% ?- gagne_plus_que(sonia,franck).
% true ;
% fail.

% ?- gagne_plus_que(franck,sonia).
% fail.

% ?- gagne_plus_que(franck,marc).
% fail.

% ?- gagne_plus_que(marc,franck).
% true ;
% fail.
