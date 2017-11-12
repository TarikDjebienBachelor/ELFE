let rec fact = function n ->
  if n = 0 then 1
  else n * fact(n-1)

let _ = Printf.printf "%d\n" (fact 6);;