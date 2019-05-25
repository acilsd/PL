(* pairs : 2-tuples *)

(* e1, e2 -> evaluates to (value of e1, value of e2)*)

fun swap (pair: int*bool) =
    (#2 pair, #1 pair);

fun sum_two_pairs (pair1: int * int, pair2: int * int) =
    (#1 pair1) + (#2 pair1) + (#1 pair2) + (#2 pair2);

fun div_mod (x: int, y: int) =
    (x div y, x mod y);

fun sort_pair(pair: int * int) =
    if (#1 pair) < (#2 pair) then pair else (#2 pair, #1 pair);

(*list [e1, e2, e3, e4, en] * en : type*)

val int_list = [1, 2, 3, 4, 5, 6, 7];

10::int_list; (* mov 10 to the start of list *)

val is_empty = null int_list; (* if list is empty *)

val head_list = hd int_list; (* head *)

val tail_list = tl int_list; (* tail -> all except head *)
