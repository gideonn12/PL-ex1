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

let rec all_combinations vars =
  match vars with
  | [] -> [[]]
  | var::rest ->
    let rest_combinations = all_combinations rest in
    List.concat (List.map (fun comb -> [ (var, true)::comb; (var, false)::comb ]) rest_combinations)


let table vars bool_expr =
  let combinations = all_combinations vars in
  let results = List.map (fun env -> (env, eval env bool_expr)) combinations in
  Printf.printf "[";
  List.iteri (fun i (env, result) ->
    if i > 0 then Printf.printf "; ";
    Printf.printf "(";
    Printf.printf "[";
    List.iteri (fun j (var, value) ->
      if j > 0 then Printf.printf "; ";
      Printf.printf "(\"%s\", %b)" var value
    ) env;
    Printf.printf "], %b)" result
  ) results;
  Printf.printf "]\n";
  results;;
