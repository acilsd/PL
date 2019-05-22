(*static env -> x: type int*)
(*static env before evaluation*)
(*dynamic env -> actial bindings -> x = 34*)

val x = 34;
val y = 17;
val z = x * y;

val abs = if z < 0 then 0 - z else z;

val built_in = abs z;
