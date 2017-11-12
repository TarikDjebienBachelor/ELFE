(* QUESTION 1 *)

let decale nb c = 
      let posC = int_of_char c 
      and posA = int_of_char 'A'
      and posZ = int_of_char 'Z'
      and posa = int_of_char 'a'
      and posz = int_of_char 'z'
      in 
      
      if (posC <= posZ)&&(posC >= posA) then
        if (posC+nb <= posZ) then  
           char_of_int(posC+nb)
        else char_of_int(((posC+nb) mod posZ) + posA -1)
 else if (posC <= posz)&&(posC >= posa) then
        if (posC+nb <= posz) then
           char_of_int(posC+nb)
        else char_of_int(((posC+nb) mod posz) + posa -1)
 else c;; 

let saufInitiale s = String.sub s 1 ((String.length s)-1);; 

(* QUESTION 2 *)

let rec cesar dec message =
      if message = "" then ""
      else String.make 1 (decale dec (String.get message 0)) ^ cesar dec (saufInitiale message);; 

(* QUESTION 3 *)

(* pour decoder un message de cesar de decalage = x  

cesar 3 "Le pont neuf fait soixante pieds." ;;

il suffit de reutiliser le codage de cesar avec un decalage = -x

cesar (-3) "Oh srqw qhxi idlw vrladqwh slhgv.";;
*)

(* QUESTION 4 *)

let que_fais_je = function s ->
let g = cesar 17 in
cesar 9 (g s);;

(* autrement dit on fait : 
    cesar 9 (cesar 17 s) 
<=> cesar 25 s
<=> s car Card(Alphabet) = 25
<=> val que_fais_je : string -> string = <fun> = Identite sur les chaine de caractere de regex ([A-Z][a-z])*
*)

(* QUESTION 5 *)

let main () =
let n = int_of_string Sys.argv.(1)
and s = Sys.argv.(2) in
Printf.printf "%s\n" (cesar n s) ;
exit 0
let _ = main ()

