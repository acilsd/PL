fun almost_good_max (xs: int list) =
    if null(xs) then 0
    else if null(tl(xs)) then hd(xs)
    else
        let val tl_res = almost_good_max(tl(xs))
        in
            if hd(xs) > tl_res then hd(xs) else tl_res
        end;

fun pretty_good_max (xs : int list) =
    if null(xs) then NONE
    else
        let val tl_res = pretty_good_max(tl(xs))
        in
            if isSome tl_res andalso valOf tl_res > hd(xs)
            then tl_res
            else SOME (hd(xs))
        end;

fun really_good_max (xs : int list) =
    if null(xs) then NONE
    else
        let fun max_res (xs : int list) =
                if null(tl(xs)) then hd(xs)
                else
                    let val tl_res = max_res(tl(xs))
                    in
                        if hd(xs) > tl_res
                        then hd(xs)
                        else tl_res
                    end;
        in
            SOME (max_res(xs))
        end;
