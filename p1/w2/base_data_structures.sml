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


fun sum_list (xs: int list) =
    if null(xs) then 0 else hd(xs) + sum_list(tl(xs));

fun mult_list (xs: int list) =
    if null(xs) then 1 else hd(xs) * mult_list(tl(xs));

fun countdown (x: int) =
    if x = 0 then [] else x :: countdown(x - 1);

fun append (xs: int list, ys: int list) =
    if null(xs) then ys else (hd xs) :: append (tl xs), ys;

fun sum_pair_list (xs: (int * int) list) =
    if null xs then 0 else #1 (hd xs) + #2 (hd xs) + sum_pair_list(tl xs);

fun firsts (xs: (int* int) list) =
    if null xs then [] else (#1 (hd xs)) :: firsts(tl xs);

fun seconds (xs: (int * int) list) =
    if null xs then [] else (#2 (hd xs)) :: seconds(tl xs);

fun sum_pair_list_2 (xs: (int * int) list) =
    (sum_list (firsts xs)) + (sum_lists (seconds xs));

