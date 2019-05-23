(* shadowing *)
val a = 10;

val b = a * 2;

val a = 5;

(* b still bounded to the first assignment of a, b -> 20*)

val c = b;

(*a -> 5 b -> 20 c -> 20*)

val d = a;

(* d -> 5 *)

val a = a + 1;

(* a -> 6*)

val f = a * 2; 

(* f -> 12 *)

 
