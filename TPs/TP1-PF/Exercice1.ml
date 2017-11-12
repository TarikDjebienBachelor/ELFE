(*question 1*)

132 ;;
125.78 ;;
1+2 ;;

(* tarik@Tarik-Linux:~/Bureau$ ocaml < Exercice1.ml 
        Objective Caml version 3.11.2

# - : int = 132
# - : float = 125.78
# - : int = 3
*)

(* Question 2 *)

# let x = 2 ;;
val x : int = 2
# x ;;
- : int = 2
# let x = 3;;
val x : int = 3
# x ;;
- : int = 3
# let y = x * x ;;
val y : int = 9
# let x = x * x ;;
val x : int = 9
# let x = 4 * 7 + 3 ;;
val x : int = 31
# let y = (x - 29) * x ;;
val y : int = 62
# let a = x - y and b = x + y ;;
val a : int = -31
val b : int = 93
# a ;;
- : int = -31

(* Question 3 *)

# 4.0 + 3.0 ;;
Error: This expression has type float but an expression was expected of type
         int
# 4.0 +. 3.0 ;;
- : float = 7.


(* Question 4 *)

# let pi = 3.14 and r = 2.0 in 2. *. pi *. r ;;
- : float = 12.56

(* Question 5 *)

# let x = 1 ;;
val x : int = 1
# let y = 2 ;;
val y : int = 2
# (x,y);;
- : int * int = (1, 2)
# (1,2,"elfe");;
- : int * int * string = (1, 2, "elfe")
# let xf = 1.0 ;;
val xf : float = 1.
# let yf = 2.0 ;;
val yf : float = 2.
# (xf,yf);;
- : float * float = (1., 2.)

(* Question 6 *)

# [x;y;x];;
- : int list = [1; 2; 1]

(* Question 7 *)

# xf = 4.0 ;;
- : bool = false
# xf ;;
- : float = 1.
# x ;;
- : int = 1
# x = 2 ;;
- : bool = false

(* Question 8 *)

# let ma = 7 in
    let la =
       let ma = 2 in
           ma +1 in
       ma + la ;;
- : int = 10

# let x = 1;;
val x : int = 1
# x;;
- : int = 1
# let z = 
     let x = x + x in
        let x = x + x in 
             x + x ;;
val z : int = 8
# z ;;
- : int = 8
# x ;;
- : int = 1

(* Question 9 *)

# if false then 5 else 7 ;;
- : int = 7
# if true then 5 else 7 ;;
- : int = 5
# if 4 < 2 then 3*5 else 7*1;;
- : int = 7
# if 4=2*2 then 3*5 else 7*1;;
- : int = 15