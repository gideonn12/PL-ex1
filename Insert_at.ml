let rec insert_at v pos lst =
  match lst with
  | [] -> if pos = 0 then [v] else []
  | h::t -> if pos = 0 then v::h::t else h::(insert_at v (pos-1) t);;
