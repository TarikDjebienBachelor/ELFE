%%%%%%%%%%%%%%%% MOTS CROISES %%%%%%%%%%%%%%%%%%%%%

mot(astante,a,s,t,a,n,t,e).
mot(astoria,a,s,t,o,r,i,a).
mot(baratto,b,a,r,a,t,t,o).
mot(colbato,c,o,l,b,a,t,o).
mot(pistola,p,i,s,t,o,l,a).
mot(statale,s,t,a,t,a,l,e).

% Question 7

motscroises(V1,V2,V3,H1,H2,H3):-mot(V1,_,X1,_,Y1,_,Z1,_),mot(V2,_,X2,_,Y2,_,Z2,_),mot(V3,_,X3,_,Y3,_,Z3,_),
                                mot(H1,_,X1,_,X2,_,X3,_),mot(H2,_,Y1,_,Y2,_,Y3,_),mot(H3,_,Z1,_,Z2,_,Z3,_).

% Question 8

% Il existe 3 solutions.

% ?- motscroises(X,Y,Z,T,V,W).

% X = astante,         a   b   s
% Y = baratto,       a s t a n t e
% Z = statale,         t   r   a
% T = astante,       b a r a t t o
% V = baratto,         n   t   a
% W = statale ;      s t a t a l e
%                      e   o   e

% X = astoria,         a   c   p
% Y = colbato,       a s t o r i a
% Z = pistola,         t   l   s
% T = astoria,       c o l b a t o
% V = colbato,         r   a   o
% W = pistola ;      p i s t o l a
%                      a   o   a

% X = baratto,         b   b   s
% Y = baratto,       b a r a t t o
% Z = statale,         r   r   a
% T = baratto,       b a r a t t o
% V = baratto,         t   t   a
% W = statale ;      s t a t a l e
%                      o   o   e

% false.
