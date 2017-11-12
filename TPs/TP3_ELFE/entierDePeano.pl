/* Récursivité TP3 ELFE              */
/* entierDePeano.pl                  */
/* Djebien Tarik groupe4             */

%%%%%%%%%%%%% DEFINITION D'UN ENTIER DE PEANO %%%%%%%%%%%%%%%%%%%

% Entier ::= zero | succ(Entier).

% Question 6

/* 6.1 */

/* prédicat entier(X) = TRUE ssi X est un entier de peano */
entier(zero).
entier(succ(X)):-entier(X).

/* 6.2 */
/*
?- entier(zero).
true.

?- entier(succ(succ(zero))).
true.

?- entier(succ(succ(0))).
fail.

?- entier(f(zero)).
fail.

?- entier(X).
X = zero ;
X = succ(zero) ;
X = succ(succ(zero)) ;
X = succ(succ(succ(zero))) ;
X = succ(succ(succ(succ(zero)))) ;
X = succ(succ(succ(succ(succ(zero))))) ;
X = succ(succ(succ(succ(succ(succ(zero)))))) ;
X = succ(succ(succ(succ(succ(succ(succ(zero))))))) ;
X = succ(succ(succ(succ(succ(succ(succ(succ(zero)))))))) ;
X = succ(succ(succ(succ(succ(succ(succ(succ(succ(zero))))))))) ;
X = succ(succ(succ(succ(succ(succ(succ(succ(succ(succ(...)))))))))) ;

On a une infinité de solution pour ce dernier but.
*/

% Question 7

/* 7.1 */

inf_ou_egal(zero,_).
inf_ou_egal(succ(X),succ(Y)):-inf_ou_egal(X,Y).

/* 7.2 */

/*
?- inf_ou_egal(succ(zero),succ(succ(zero))).
true.

?- inf_ou_egal(succ(succ(zero)),succ(zero)).
fail.

?- inf_ou_egal(X,succ(succ(zero))).
X = zero ;
X = succ(zero) ;
X = succ(succ(zero)) ;
fail.

?- inf_ou_egal(succ(zero),Z).
Z = succ(_G288);

Interpretation :
[trace]  ?- inf_ou_egal(succ(zero),Z). % arbre de resolution de requete : inf_ou_egal(succ(zero),Z).
   Call: (6) inf_ou_egal(succ(zero), _G371) ? creep % Choix 1 rencontré : tete de regle inf_ou_egal(succ(X),succ(Y))
   % avec son upm = { zero/X , Z/succ(Y) } avec Z = _G371
   Call: (7) inf_ou_egal(zero, _G420) ? creep % Choix 2 rencontré : le fait inf_ou_egal(zero,_)
   % avec sa variable anonyme _=_G420
   Exit: (7) inf_ou_egal(zero, _G420) ? creep % ici on ne peut pas unifier la constante zero avec la constante = succ(zero) donc echec
   Exit: (6) inf_ou_egal(succ(zero), succ(_G420)) ? creep % retour sur la branche du 1er choix rencontré avec la tete de regle:
   % Ici on unifie la variable Z=_G371 avec succ(Y) avec Y=_G420
Z = succ(_G420). % La seule solution possible que nous renvoie PROLOG est donc Z = succ(_G420).
% remarque : je ne comprend pas pourquoi PROLOG attribue _G420 à Y alors qu'il la deja fait pour la variable anonyme ?
% explication possible : serait-ce a cause du fait que celle ci fût detruite lors de l'echec puis reattribuée ensuite à Y ? 
*/

% Question 8

/* 8.1 */
% Notons les entiers de peano l'ensemble T
% On verifie que le groupe (T,+) est abélien

% par les propriétés suivantes :

%  0 + n = n  (élement neutre de la loi +)
add(zero,P,P):-entier(P).

% a + b = b + a ( commutativité de la loi +)

% n + (-n) = 0 (element inverse pour tout n dans (T,+))

%      n + (p+1) = (n+p) + 1 (associativite de la loi +)

% On pose : n+p = z
% =>  n + succ(p) = z + 1
% =>  n + succ(p) = succ(z) equivalent à succ(n) + p = succ(z)
% d'où notre equation : 
%        succ(n) + p - succ(z) = 0  (ADDITION)
add(succ(N),P,succ(Z)):-add(N,P,Z).



/* 8.2 */

/*
?- add(succ(zero),succ(succ(zero)),succ(succ(zero))).
false.

?- add(succ(zero),succ(succ(zero)),succ(succ(succ(zero)))).
true.

?- add(succ(zero),succ(succ(zero)),R).
R = succ(succ(succ(zero))).
% 1 solution

?- add(succ(zero),Z,succ(succ(succ(zero)))).
Z = succ(succ(zero)).
% 1 solution

?- add(succ(zero),X,Y).
X = zero,
Y = succ(zero) ;
X = zero,
Y = succ(zero) ;
Y = succ(X).
% 2 solution (X,Y)={ (0,1) , (X,succ(X)) }

%*/


/* 8.3 */
% (SOUSTRACTION)
%     X - Y = Z
% <=> X     = Z + Y 

% d 'où : (X-Y=Z) => (Z+Y=X)
sub(X,Y,Z):-add(Z,Y,X).

/* 8.4 */
% (MULTIPLICATION)
% élément neutre de la loi 'x'
% X * 0 = 0
% 0 * X = 0
mult(zero,X,zero):-entier(X).

% (X*Y=W) && (W+Y=Z)  => (X+1)*Y = Z
mult(succ(X),Y,Z):-mult(X,Y,W),add(W,Y,Z).

/* BONUS */

% (PLUS_PETIT/2 <=> X < Y )
% Soit X un entier positif alors 0 < X+1 (Axiome d'Archimede)
plus_petit(zero,succ(X)):-entier(X).
% X < Y => X+1 < Y+1 => succ(X) < succ(Y)
plus_petit(succ(X),succ(Y)):-plus_petit(X,Y).

% (QUOTIENT/4)
% quotient(A,B,Q,R) vrai <=> Q = A/B et R = A modulo B
% division euclidienne : A = B*Q + R avec R < B
quotient(A,B,Q,R):-mult(Q,B,X),add(X,R,A),plus_petit(R,B).

% (FACTORIELLE/2)
% factorielle(X,Y) vrai ssi Y=X!
% 0! = 1
factorielle(zero,succ(zero)).
% X! = (X-1)!*X
% d'où (X+1)! = X! * (X+1) = Y
factorielle(succ(X),Y):-factorielle(X,R),mult(R,succ(X),Y).

% 3!
% ?- factorielle(succ(succ(succ(zero))),RES).
% RES = succ(succ(succ(succ(succ(succ(zero)))))).

% 5/2
% ?- quotient(succ(succ(succ(succ(succ(zero))))),succ(succ(zero)),X,Y).
% X = succ(succ(zero)),
% Y = succ(zero) ;
