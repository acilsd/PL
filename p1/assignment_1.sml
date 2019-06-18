
fun get_year (date : int * int * int) = #1(date);

fun get_month (date : int * int * int) = #2(date);

fun get_day (date : int * int * int) = #3(date);


(*  1

 write a function that takes 2 dates and evals to true of false
 if the 1st is a date that comes before the second -> true
otherwise -> false
 *)

fun is_older (date1 : int * int * int, date2: int * int * int) =
    if get_year(date1) < get_year(date2) then true
    else if get_year(date1) > get_year(date2) then false
    else if get_month(date1) < get_month(date2) then true
    else if get_month(date1) > get_month(date2) then false
    else if get_day(date1) < get_day(date2) then true
    else false


(*  2
 write a fun that takes a list of dates and a month and returns how mane dates in the list are in the given month
*)

fun number_in_month (date_list : (int * int * int) list, month : int) =
    let
        fun calc_dates (dates : (int * int * int) list, acc : int) =
            if null(dates) then acc
            else
                if get_month(hd(dates)) = month
                then calc_dates(tl(dates), acc + 1)
                else calc_dates(tl(dates), acc)
    in
        calc_dates(date_list, 0)
    end;

(*  3
 list of dates * list of month -> number of dates in the list of dates that are in any of the month in the list of month
*)

fun number_in_months (dates : (int * int * int) list, months: int list) =
    let
	      fun compare_months (next : int, current: int list) =
	          if null(current) then false
	          else
		            if next = (hd(current)) then true
		            else compare_months(next, tl(current))

	      fun traverse_dates_list(rest_dates : (int * int * int) list, acc: int) =
	          if null(rest_dates) then acc
	          else
		            if compare_months(get_month(hd(rest_dates)), months)
		            then traverse_dates_list(tl(rest_dates), acc + 1)
		            else traverse_dates_list(tl(rest_dates), acc)
    in
	      traverse_dates_list(dates, 0)
    end;



(* 4
 dates_in_month
list * int -> list

*)

fun dates_in_month (dates: (int * int * int) list, month: int) =
    let
	      fun traverse_dates_list (rest : (int * int * int) list, acc: (int * int * int) list) =
	          if null(rest) then acc
	          else
                if get_month(hd(rest)) = month
		            then traverse_dates_list(tl(rest), hd(rest) :: acc)
		            else traverse_dates_list(tl(rest), acc)
    in
	      traverse_dates_list(dates, [])
    end;



(*  5
dates_in_months
list * list -> list *)

fun dates_in_months (dates : (int * int * int) list, months: int list) =
    let
	      fun traverse_months_list (rest : int list, acc: (int * int * int) list) =
            if null(rest) then acc
            else traverse_months_list(tl(rest), dates_in_month(dates, hd(rest)) @ acc)

    in
        traverse_months_list(months, [])
    end;

(* 6

get_nth

list ( int -> nth int)

*)

fun get_nth (str_l : string list, index: int) =
    if index > 1
    then get_nth(tl(str_l), index - 1)
    else hd(str_l);

(* 7

date_to_string
 *)

fun date_to_string (date : int * int * int) =
    let
        val list_of_months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
	      get_nth(list_of_months, get_month(date)) ^ " " ^  Int.toString(get_day(date)) ^ ", " ^ Int.toString(get_year(date))
    end;


(* 8
 duuh
 *)
fun number_before_reaching_sum (sum : int, integerList: int list) =

    let
	      fun find_pivot_index (rest : int list, acc: int, index: int) =
            if acc >= sum
	          then index - 1
            else find_pivot_index(tl(rest), (hd(rest)) + acc, index + 1)
    in
        find_pivot_index(integerList, 0, 0)
    end;



(* 9 *)
fun what_month (day : int) =
    let
	      val days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	      number_before_reaching_sum(day, days_in_month) + 1
    end;



(* 10 *)
fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else [what_month(day1)] @ month_range(day1 + 1, day2);




(* 11 *)
fun oldest (dates : (int * int * int) list) =
    if null(dates)
    then NONE
    else
	      let
	          fun traverse_dates_list(oldestDate: (int * int * int), remainingDates: (int * int * int) list) =
		            if null(remainingDates)
		            then SOME oldestDate
		            else
		                if is_older(oldestDate, hd(remainingDates))
		                then traverse_dates_list(oldestDate, tl(remainingDates))
		                else traverse_dates_list(hd(remainingDates), tl(remainingDates))
	      in
	          traverse_dates_list(hd(dates), tl(dates))
	      end; 
