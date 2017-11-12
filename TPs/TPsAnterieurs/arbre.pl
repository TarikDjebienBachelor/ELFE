%
% Des exemples d arbres
% à utiliser pour les tests en faisant :
%     ?- exempleArbre(Arbre),predicat_a_tester(Arbre).
% par exemple :
%     ?- exempleArbre(Arbre), estFeuille(Arbre).
%

% arbre vide
exempleArbre(vide).

% une feuille
exempleArbre(noeud(1, vide, vide)).

% différents arbres
exempleArbre(noeud(1,
	    noeud(2,
		  vide,
		  vide),
	    vide)).

exempleArbre(noeud(7,
	    noeud(3,
		  vide,
		  noeud(9,
			vide,
			vide)),
	    noeud(12,
		  vide,
		  vide))).
			

exempleArbre(noeud(10,
	    noeud(5,
		  noeud(3,
			noeud(1,vide,vide),
			noeud(4,vide,vide)),
		  noeud(4,vide,vide)),
	    noeud(12,
		  vide,
		  noeud(3,vide,vide)))).

