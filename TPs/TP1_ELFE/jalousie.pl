% Question 1

femme(mia).
femme(jody).
femme(yolande).
aime(vincent,mia).
aime(vincent,pierre).
aime(marcellus,mia).
aime('mon chou',lapin).
aime(lapin,'mon chou').
jaloux(X,Y):-aime(X,Z),aime(Y,Z).

% Question 2

% ?- consult(exemple).
% exemple compiled 0.00 sec, 168 bytes
% true.

% Question 3

% ?- listing.

%   Foreign: rl_read_history/1

% femme(mia).
% femme(jody).
% femme(yolande).

%   Foreign: rl_write_history/1

%   Foreign: rl_add_history/1

% jaloux(A, B) :-
% 	aime(A, C),
%	aime(B, C).

%   Foreign: rl_read_init_file/1

% aime(vincent, mia).
% aime(vincent, pierre).
% aime(marcellus, mia).
% aime('mon chou', lapin).
% aime(lapin, 'mon chou').
% true.

% ?- listing(femme).
% femme(mia).
% femme(jody).
% femme(yolande).

% true.

% Question 4

% ?- femme(mia).
% true.

% ?- femme(yolande).
% true.

% ?- femme(lapin).
% fail.

% Question 5

% ?- femme(X).
% X = mia ;
% X = jody ;
% X = yolande.

% Question 6

% ?- aime(vincent,X),femme(X).
% X = mia ;
% fail.

% Question 7

% On remarque que le predicat homme(X) est indefinit
% ici on pourrait faire :
% ?- aime(vincent,X),not(femme(X)).
% et on obtiendrai la reponse suivante :
% X = pierre.
% Cependant, il vaut mieux declarer un predicat homme(X) car ici on enumere tout ce qui est different de une femme
% donc on pourrait avoir un lapin par exemple ce qui ne convient pas au but de la requete de la question 7.
% La meilleure solution consite a faire ceci :


homme(vincent).
homme(pierre).

% Question 8

% ?- jaloux(vincent,X).
% X = vincent ;
% X = marcellus ;
% X = vincent ;
% fail.

% Question 9

% ?- jaloux(vincent,_).
% true .

estJaloux(X):-jaloux(X,_).

% ?- estJaloux(vincent).
% true .
