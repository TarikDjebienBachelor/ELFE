%%%%%%%%%%%%%%%%%%% RESOLUTION %%%%%%%%%%%%%%%%%%%

f(a).
f(b).

g(a).
g(b).

h(b).

k(X):- f(X), g(X), h(X).

% Question 6

% ?- trace.
% Unknown message: query(yes)   
% [trace]  ?- k(X).           % construction de l'arbre abstrait
%  Call: (7) k(_G312) ? creep % on cherche les valeur possibles pour X dans la tete de regle k(X)
%  Call: (8) f(_G312) ? creep % on verifie dans f() pour la meme valeur de X dans k(X)
%  Exit: (8) f(a) ? creep     % pour X=a , f(a) existe,
%  Call: (8) g(a) ? creep     % c'est OK donc on passe a g().
%  Exit: (8) g(a) ? creep     % pour X=a , g(a) existe,
%  Call: (8) h(a) ? creep     % c'est OK donc on passe a h(), pour X=a , h(a) n'existe pas,
%  Fail: (8) h(a) ? creep     % c'est KO donc la regle k(a) n'est pas satisfaite
%  Redo: (8) f(_G312) ? creep % on recommence et on verifie dans f() pour la meme valeur de X dans k(X)
%  Exit: (8) f(b) ? creep     % cette fois avec X=b, f(b) existe,
%  Call: (8) g(b) ? creep     % c'est OK donc on passe a g().
%  Exit: (8) g(b) ? creep     % pour X=b , g(b) existe,
%  Call: (8) h(b) ? creep     % c'est OK donc on passe a h(). 
%  Exit: (8) h(b) ? creep     % pour X=b , h(b) existe, c'est OK 
%  Exit: (7) k(b) ? creep     % donc on passe a la tete de la regle k(X) avec X=b qui est satisfaite
% X = b ;                     % X=b est donc solution de la resolution de K(X):- f(X),g(X),h(X). 
% fail.                       % on a parcouru toute les valeurs possibles de X = (a,b) donc c'est fini.

