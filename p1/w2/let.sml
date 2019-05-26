(* let v1 v2 vn in e end *)
(* v : binding, e : expression*)

fun ex (z : int) =
    let
        val x = if z > 0 then z else 42;
        val y = if z < 0 then z else 42;
    in
        if x = 42 then x * 2 else y * y
    end;


fun ex2 (x : int) =
    let val x = 1
    in
        (let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
    end
