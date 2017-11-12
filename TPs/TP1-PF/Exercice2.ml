(* Question 1 *)

# String.length ;;        
- : string -> int = <fun>
# String.length "tarik";; 
- : int = 5

(* Question 2 *)

# String.sub;;            
- : string -> int -> int -> string = <fun>
# String.sub "tarik" 2 3;;
- : string = "rik"

(* Question 3 *)

# let initiale s = String.sub s 0 1;;
val initiale : string -> string = <fun>
# initiale "tarik";;
- : string = "t"

# let saufInitiale s = String.sub s 1 ((String.length s)-1);;  
val saufInitiale : string -> string = <fun>
# saufInitiale "tarik";;                                     
- : string = "arik"

# let finale s = String.sub s ((String.length s)-1) 1;;
val finale : string -> string = <fun>
# finale "tarik";;
- : string = "k"

# let saufFinale s = String.sub s 0 ((String.length s)-1);;
val saufFinale : string -> string = <fun>
# saufFinale "tarik";;
- : string = "tari"

# let rec miroir s = if s="" then "" else (finale s) ^ (miroir(saufFinale s));;
val miroir : string -> string = <fun>
# miroir "tarik";;                                                      
- : string = "kirat"
