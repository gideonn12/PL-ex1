type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr;;

let rec eval env bool_expr =
  match bool_expr with
  | And (x, y) -> eval env x && eval env y
  | Or (x, y) -> eval env x || eval env y
  | Not x -> not (eval env x)
  | Var x -> List.assoc x env;;

let table_two var1 var2 bool_expr =
  let results = [
    (true, true, eval [(var1, true); (var2, true)] bool_expr);
    (true, false, eval [(var1, true); (var2, false)] bool_expr);
    (false, true, eval [(var1, false); (var2, true)] bool_expr);
    (false, false, eval [(var1, false); (var2, false)] bool_expr)
  ] in
  Printf.printf "[";
  List.iteri (fun i (a, b, result) ->
    if i > 0 then Printf.printf "; ";
    Printf.printf "(%b, %b, %b)" a b result
  ) results;
  Printf.printf "]\n";
  results;;
