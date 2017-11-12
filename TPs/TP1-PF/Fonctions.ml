(* Question 10 *)

(* abs: Z -> N
a -> -a si a < = 0
a sinon
*)

(* SYNTAXE: function <param> -> <expr> *)

# function a -> if a < 0 then -a else a ;;
- : int -> int = <fun>
# (function a -> if a < 0 then -a else a) -3 ;;
Error: This expression should not be a function, the expected type is
int
# (function a -> if a < 0 then -a else a) (-3) ;;
- : int = 3

(* deux declarations globales equivalentes *)

# let abs = function a -> if a < 0 then -a else a ;;
val abs : int -> int = <fun>

(* sans le mot cle function *)

# let abs a = if a < 0 then -a else a ;;
val abs : int -> int = <fun>

(* attention lorsqu’on melange les deux styles...*)

# let abs a = function a-> if a < 0 then -a else a ;;
val abs : 'a -> int -> int = <fun>

(* fonctions and parentheses *)

# let carre x = x * x ;;
val carre : int -> int = <fun>
# carre(4);;
- : int = 16
# carre 4 ;;
- : int = 16
# carre (2+3);;
- : int = 25
# carre 2+3 ;;
- : int = 7
# (carre 2)+3;;
- : int = 7
# carre 2 + carre 3 ;;
- : int = 13
# carre ( 2 + carre 3);;
- : int = 121
# carre(carre 3);;
- : int = 81

(* Question 11 *)

# (* calcul polynomial *)
  let monpoly x =
    let a = 2
    and b = -3
    and c = 5
    in 
      a*x*x + b*x + c ;;
val monpoly : int -> int = <fun>

# monpoly 2;;
- : int = 7

# (* des fonctions avec des strings *)
  let repeat x = x ^ x ;;
val repeat : string -> string = <fun>

# repeat "les vacances";;
- : string = "les vacancesles vacances"
# let rallonge x = x ^" c'est bien";;
val rallonge : string -> string = <fun>
# rallonge "les vacances";;
- : string = "les vacances c'est bien"
# rallonge repeat "les vacances";;
Error: This function is applied to too many arguments;
maybe you forgot a `;'
# rallonge (repeat "les vacances");;
- : string = "les vacancesles vacances c'est bien"
# let vide x = x="";;
val vide : string -> bool = <fun>
# vide "j'ai enfin tout compris !";;
- : bool = false

#(* declaration de fonction, variable, et portee statique... *)
  let p = 10;;
val p : int = 10
# let k x = (x,p,x+p);;
val k : int -> int * int * int = <fun>
# k 1003;;
- : int * int * int = (1003, 10, 1013)
# let p = 1003;;
val p : int = 1003
# k p;;
- : int * int * int = (1003, 10, 1013)
(*
Question: pourquoi 10 et pas 1003 ? 
Reponse : Car lors de la declaration de la fonction k, la valeur de p fut definie à 10 comme constante dans la fonction
          Ici le p = 1003 definie dans l'environnement est un autre p qui est passé par valeur a la fonction k
          ce n'est pas le p dans la definition de k.
          En Ocaml, on sauvegarde la definition d'une fonction en memoire et celle ci ne bouge plus sauf si on la redefinie.
*)


# (* calculer puissance 8 pour la valeur 2*)

# let a = 2*2 ;;
val a : int = 4
# let b = a*a;;
val b : int = 16
# let c = b*b;;
val c : int = 256

# (* abstraire le calcul pour la valeur x *)
  
  let a x = x*x;;
val a : int -> int = <fun>
# let b x = a x * a x ;;
val b : int -> int = <fun>
# let puissance8 x = b x * b x;;
val puissance8 : int -> int = <fun>
# puissance8 2;;
- : int = 256
# puissance8 3;;
- : int = 6561
# b 2;;
- : int = 16

(* la portée des fonctions a,b et puissance8 est global : elles sont definies dans l'environnement
   d'un point de vue logiciels, ce n'est pas bon car les fonctions auxiliaire a,b devraient avoir 
   une portée locale dans la fonction puissance8 qui elle sera globale.
   On devra limiter la portee avec des in comme ceci :
*)

# let puissance8 x = 
               let a = x*x in 
                   let b = a*a in 
                           b * b;;
val puissance8 : int -> int = <fun>
# puissance8 2;;
- : int = 256
# b 2;;
Error: Unbound value b

(* autre definition. avec fonction auxiliaire qu’on veut bien
garder dans l’environnement global *)


# let carre x = x*x;;
val carre : int -> int = <fun>
# let power8 x = carre(carre(x)*carre(x));;
val power8 : int -> int = <fun>
# power8 2;;
- : int = 256
# power8 3;;
- : int = 6561
# puissance8 3;;
- : int = 6561

(* fonction avec deux parametres *)

# let average a b = (a + b)/2;;
val average : int -> int -> int = <fun>
# average 3 4;;
- : int = 3
# average 3 ;; 
- : int -> int = <fun>
# let average a b = (a +. b)/. 2.0;;
val average : float -> float -> float = <fun>
# average 3.0 4.0 ;;                
- : float = 3.5
# average 3.0;;                     
- : float -> float = <fun>

(* Une fonctionnelle sur les listes *)


# let double x = x * 2
      in List.map double [31;19;3];;
- : int list = [62; 38; 6]

(* Question 13 *)

# let rec even x = (x mod 2 = 0) and odd x = (not (even x)) ;;
val even : int -> bool = <fun>
val odd : int -> bool = <fun>
# even 4;;
- : bool = true
# odd 4;;
- : bool = false
# odd 5;;
- : bool = true
# even 5;;
- : bool = false

(* Question 14 *)

# let a = 13
     in let b = a*a in
         let c = b * b in 
                 a * b * c ;;
- : int = 62748517

# (function a ->
     ( function a2 -> 
        ( function a4 ->
              a * a2 * a4
        ) (a2*a2)
     ) (a*a)
  ) 13 ;;
- : int = 62748517

(* Question 15 *)

# let sign x = if x = 0 then 0 else if x > 0 then 1 else -1 ;;
val sign : int -> int = <fun>
# sign 0;;
- : int = 0
# sign 8;;
- : int = 1
# sign (-9);;
- : int = -1

(* Question 16 *)

# let xor a b = ((not a) && b)  || (a && not b);;
val xor : bool -> bool -> bool = <fun>

# xor 1 0;;
Error: This expression has type int but an expression was expected of type
         bool
# xor true false;;
- : bool = true
# xor false true;;
- : bool = true
# xor false false;;
- : bool = false
# xor true true;;  
- : bool = false

(* Question 17 *)

# let rec fibo n = if n <= 1 then n else fibo(n-1)+(fibo(n-2));;
val fibo : int -> int = <fun>
# fibo 0;;
- : int = 0
# fibo 1;;
- : int = 1
# fibo 2;;
- : int = 1
# fibo 3;;
- : int = 2
# fibo 4;;
- : int = 3
# fibo 5;;
- : int = 5
# fibo 6;;
- : int = 8
