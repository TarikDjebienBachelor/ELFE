%%%%%%%%%%%%% GENERATEUR DE PHRASE %%%%%%%%%%%%%%%%%%.


% Structure : determinant    nom        verbe     determinant    nom 
% Exemples  :     le         chat       mange        la          souris
%                 l'        etudiant    écoute       le          professeur


% Question 9

% prédicat mot/2 
% mot(string,attribut) avec attribut={determinant, nom, verbe}

% LEXIQUE :

mot(le,determinant).
mot(la,determinant).
mot(chat,nom).
mot(souris,nom).
mot(mange,verbe).
mot(cherche,verbe).

% QUESTION 10

phrase(X,Y,Z,T,V):-mot(X,determinant),mot(Y,nom),mot(Z,verbe),mot(T,determinant),mot(V,nom).

% le chat mange le chat
% le chat mange le souris

% le chat mange la chat
% le chat mange la souris

% le chat cherche le chat
% le chat cherche le souris
% le chat cherche la chat
% le chat cherche la souris

% le souris mange le chat
% le souris mange le souris
% le souris mange la chat
% le souris mange la souris
% le souris cherche le chat
% le souris cherche le souris
% le souris cherche la chat
% le souris cherche la souris

% la chat mange le chat
% la chat mange le souris
% la chat mange la chat
% la chat mange la souris
% la chat cherche le chat
% la chat cherche le souris
% la chat cherche la chat
% la chat cherche la souris
% la souris mange le chat
% la souris mange le souris
% la souris mange la chat
% la souris mange la souris
% la souris cherche le chat
% la souris cherche le souris
% la souris cherche la chat
% la souris cherche la souris

% 2 + 2 + 4 + 8 + 16 = 32 possibilités
% pour l'ordre, je suppose que PROLOG commence par lire de droite a gauche:
% - il teste touts les cas possibles pour nom 
% - puis tout les cas possibles pour determinant
% - puis verbe
% - puis nom 
% - et enfin determinant
% En conservant a chaque fois les nouvelles phrases syntaxiquement correcte trouvée

% Verification

% ?- phrase(X,Y,Z,T,V).

% X = le,
% Y = chat,
% Z = mange,
% T = le,
% V = chat ;

% +1

% X = le,
% Y = chat,
% Z = mange,
% T = le,
% V = souris ;

% +2

% X = le,
% Y = chat,
% Z = mange,
% T = la,
% V = chat ;

% +3

% X = le,
% Y = chat,
% Z = mange,
% T = la,
% V = souris ;

% +4

% X = le,
% Y = chat,
% Z = cherche,
% T = le,
% V = chat ;

% +5

% X = le,
% Y = chat,
% Z = cherche,
% T = le,
% V = souris ;

% +6

% X = le,
% Y = chat,
% Z = cherche,
% T = la,
% V = chat ;

% +7

% X = le,
% Y = chat,
% Z = cherche,
% T = la,
% V = souris ;

% +8

% X = le,
% Y = souris,
% Z = mange,
% T = le,
% V = chat ;

% +9

% X = le,
% Y = souris,
% Z = mange,
% T = le,
% V = souris ;

% +10

% X = le,
% Y = souris,
% Z = mange,
% T = la,
% V = chat ;

% +11

% X = le,
% Y = souris,
% Z = mange,
% T = la,
% V = souris ;

% +12

% X = le,
% Y = souris,
% Z = cherche,
% T = le,
% V = chat ;

% +13

% X = le,
% Y = souris,
% Z = cherche,
% T = le,
% V = souris ;

% +14

% X = le,
% Y = souris,
% Z = cherche,
% T = la,
% V = chat ;

% +15

% X = le,
% Y = souris,
% Z = cherche,
% T = la,
% V = souris ;

% +16

% X = la,
% Y = chat,
% Z = mange,
% T = le,
% V = chat ;

% +17

% X = la,
% Y = chat,
% Z = mange,
% T = le,
% V = souris ;

% +18

% X = la,
% Y = chat,
% Z = mange,
% T = la,
% V = chat ;

% +19

% X = la,
% Y = chat,
% Z = mange,
% T = la,
% V = souris ;

% +20

% X = la,
% Y = chat,
% Z = cherche,
% T = le,
% V = chat ;

% +21

% X = la,
% Y = chat,
% Z = cherche,
% T = le,
% V = souris ;

% +22

% X = la,
% Y = chat,
% Z = cherche,
% T = la,
% V = chat ;

% +23

% X = la,
% Y = chat,
% Z = cherche,
% T = la,
% V = souris ;

% +24

% X = la,
% Y = souris,
% Z = mange,
% T = le,
% V = chat ;

% +25

% X = la,
% Y = souris,
% Z = mange,
% T = le,
% V = souris ;

% +26

% X = la,
% Y = souris,
% Z = mange,
% T = la,
% V = chat ;

% +27

% X = la,
% Y = souris,
% Z = mange,
% T = la,
% V = souris ;

% +28

% X = la,
% Y = souris,
% Z = cherche,
% T = le,
% V = chat ;

% +29

% X = la,
% Y = souris,
% Z = cherche,
% T = le,
% V = souris ;

% +30

% X = la,
% Y = souris,
% Z = cherche,
% T = la,
% V = chat ;

% +31

% X = la,
% Y = souris,
% Z = cherche,
% T = la,
% V = souris ;

% +32

% false.

% 32 possibilités