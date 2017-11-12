
filtre_reponse([au,revoir],[]).  
filtre_reponse([stop],[]).
filtre_reponse([ciao],[]).
filtre_reponse([**,euros,**],[l,argent,est,votre,probleme]).
filtre_reponse([**,argent,**],[vous,comptez,me,payer,quand,meme]).
filtre_reponse([**,va,**],[oui,mais,parlez,moi,de,vous]).
filtre_reponse([**,toi],[concentrez,vous,uniquement,sur,vous,c,est,pour,cela,que,vous,me,payez]).
filtre_reponse([oui],[oui,mais,encore,argumentez,votre,reponse]).
filtre_reponse([tu,me,**],[ne,me,tutoyer,pas]).
filtre_reponse([**,je,m,appelle,joker(X),**],[je,vous,ecoute,X,dite,moi,en,plus]).
filtre_reponse([**,tuer,**],[vive,le,secret,medical,vous,etes,malade,c,est,horrible,pourquoi]).
filtre_reponse([**,fou,**],[il,existe,des,hopitaux,psychiatrique,pour,vous]).
filtre_reponse([**,folle,**],[une,brebis,egare]).
filtre_reponse([**,achete,**],[bsahtek,combien]).
filtre_reponse([**,vendu,**],[combien]).
filtre_reponse([**,ans],[vous,faite,plus,jeune]).
filtre_reponse([wesh,**],[quel,langage,vulgaire]).
filtre_reponse([joker(X),ou,joker(Y),**],[il,faut,choisir,X,ou,Y]).
filtre_reponse([**,faim,**],[moi,je,ne,mange,pas]).
filtre_reponse([non],[vous,etes,bien,negatif]).
filtre_reponse([**,prolog,**],[alors,vous,savez,programmer]).
filtre_reponse([un,joker(X),est,un,joker(X)],[hmmm,tres,pertinent,parlez,encore,de,X]).
filtre_reponse([joker(X),et,joker(Y),sont,**],[parlez,moi,plus,de,X,et,Y]).
filtre_reponse([**,ans,**],[remontez,plus,loin,dans,vos,souvenirs]).
filtre_reponse([**,annees,**],[cela,fait,bien,longtemps]).
filtre_reponse([joker(_)],[c,est,un,peu,court]).
filtre_reponse([**,je,ne,suis,pas,joker(X)],[pourquoi,pensez,vous,que,vous,n,etes,pas,X]).
filtre_reponse([**,suis,joker(X)],[pourquoi,pensez,vous,que,vous,etes,X]).
filtre_reponse([**,ne,**],[vous,en,etes,sur]).
filtre_reponse([**,non,**],[vous,etes,tres,negatif]).
filtre_reponse([**,vous,**],[concentrez,vous,sur,votre,probleme,svp]).
filtre_reponse([**,moi,**],[recontez,m,en,plus,sur,votre,famille]).
filtre_reponse([**,je,**],[comment,cela,se,manifeste,t,il]).
filtre_reponse([**,j,ai,**],[ce,n,est,pas,la,quantite,qui,compte]).
filtre_reponse([joker(_),joker(_),joker(_)],[hmmm]).
filtre_reponse([**],[je,ne,vous,suis,pas,tres,bien]).

est_filtre_par([],[]).  
est_filtre_par([T|P],[T|F]) :- est_filtre_par(P,F).  
est_filtre_par([X|P],[joker(X)|F]) :- est_filtre_par(P,F).  
est_filtre_par(P,[**|F] ):- est_filtre_par(P,F).
est_filtre_par([_|P],[**|F]) :- est_filtre_par(P,[**|F]).

filtrage(P,R) :- filtre_reponse(F,R), est_filtre_par(P,F).

affiche([]) :- nl.
affiche([T|R]) :- write(T),write(' '),affiche(R).

suite([]).  
suite(_) :- elisa.  
elisa :- read(T),
    filtrage(T,R), /* !, *//* pour un seul filtrage sans point de choix */
    affiche(R),
    suite(R).

/* exemple de session : il faut taper les entrées telles qu'elles : crochets, virgules et points compris.

?- elisa.
|: [bonjour].
c est un peu court 
|: [je,ne,suis,pas,court].
pourquoi pensez vous que vous n etes pas court 
|: [parce,que].
je ne vous suis pas tres bien 
|: [vous,n,ecoutez,pas].
concentrez vous sur votre probleme svp 
|: [mon,probleme,est,mon,probleme].
je ne vous suis pas tres bien 
|: [vous,vous,repetez].
concentrez vous sur votre probleme svp 
|: [je,le,fais,depuis,des,annees].
comment cela se manifeste t il 
|: [je,suis,fatigue].
pourquoi pensez vous que vous etes fatigue 
|: [depuis,des,annees,je,dros,beaucoup].
cela fait bien longtemps 
|: [en,effet].
je ne vous suis pas tres bien 
|: [au,revoir].


Yes
?- 
*/
