/* Récursivité                       */
/* genealogie1.pl                    */
/* "Prolog, tout de suite !" p 66    */

enfant_de(anne,bridget).
enfant_de(bridget,caroline).
enfant_de(caroline,donna).
enfant_de(donna,emily).

descendant_de(X,Y) :- enfant_de(X,Y).
descendant_de(X,Y) :-
	enfant_de(X,Z),
	descendant_de(Z,Y).