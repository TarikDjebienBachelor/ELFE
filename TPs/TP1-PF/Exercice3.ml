(*
puissance : int * int -> int
             (x , y)  = x^y
*)
(* On remarque que x^0=1,
                   x^1=x,
                   x^n=x*x^(n-1)
*)

let rec puissance (x,n) = 
           if x = 0 then 0
      else if n = 0 then 1
      else if n = 1 then x
      else x * puissance(x,n-1)

let _ = Printf.printf "La puissance 5 de 2 vaut %d\n" (puissance(2,5));;