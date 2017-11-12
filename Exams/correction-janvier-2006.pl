%
%Ex1
%

% Q1 est_un_trans(?X,?Y)

est_un_trans(X,X) :- !.
est_un_trans(X,Z) :- 
	est_un(X,Y),
	est_un_trans(Y,Z).

% 
% EX2
%

% Q1 distance(+Mot1,+Mot2,?Dist)
distance(Mot1,Mot2,Dist) :- 
	atom_chars(Mot1,List1),
	atom_chars(Mot2,List2),
	distance_list(List1,List2,Dist).
distance_list([],L,Dist) :- length(L,Dist).
distance_list([L,[],Dist) :- length(L,Dist).
% la réponse distance_list([],[],0) qui supposait les listes de même
% longueur était acceptée
distance_list([T|R1],[T|R2],Dist) :- 
	!, 
	distance_list(R1,R2,Dist).
% si pas de cut il faut explicitement tester les différences
%  des têtes (T1\==T2) dans la clause suivante :
distance_list([_|R1],[_|R2],Dist) :- 
	distance_list(R1,R2,DistR),
	Dist is DistR + 1.

% Q2 voisin(+Mot1,+Mot2)
voisin(Mot1,Mot2) :- distance(Mot1,Mot2,1).

%Q3 cherche(+Depart,+Arrivee,?Solution).

cherche(Depart,Arrivee,Solution) :-
	cherche2(Depart,Arrivee,[],Solution).
% le parametre supplémentaire mémorisera les mots déjà vus
% puopr éviter de "tourner en rond"
cherche2(Mot,Mot,_,[Mot]) :- !.
cherche2(Depart,Arrivee,DejaVus,[Depart|ResteSolution]) :-
	motdico(Mot),
	voisin(Mot,Depart),
	\+ member(Mot,DejaVus),
	chercheZ(Mot,Arrivee,[Depart|DejaVus],ResteSolution).

% Q4. resoud(+Mot1,+Mot2).

resoud(Mot1,Mot2) :-
	cherche(Mot1,Mot2,Solution),
	!,
	affiche_liste(Solution).

affiche_liste([]) :- nl.
affiche_liste([T|R]) :- display(T), nl, affiche_liste(R).


%
% Q3.
%

%Q1

%p(X)
% |
% +----X|1---- Yes X=1
% |
% +----X|2---- ! --- Yes X = 2
% |
% +-* (coupé par cut)


%Q2
%p(X),p(Y)
% |
% +---X|1---- p(Y) 
% |            +--Y|1--- Yes X=1, Y=1
% |            |
% |            +--Y|2--- !(1) ------ Yes X=1, Y=2
% |            |
% |            +-* (coupé par !(1))
% |
% +---X|2---- !(2),p(Y)  ---- p(Y) 
% |                            +--Y|1--- Yes X=2, Y=1
% |                            |
% |                            +--Y|2--- !(3) ------ Yes X=2, Y=2
% |                            |
% |                            +-* (coupé par !(3))
% |
% |
% +---* (coupé par !(2))
%

%Q3
%p(X),!,p(Y)
% |
% +---X|1-- !(1),p(Y) --- p(Y)
% |                       +--Y|1--- Yes X=1, Y=1
% |                       |
% |                       +--Y|2--- !(2) ------ Yes X=1, Y=2
% |                       |
% |                       +-* (coupé par !(2))
% |
% +--- * (coupé par !(1))
%
%
%
