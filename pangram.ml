(* Submit this file once your pangram implementation is complete. *)
let is_pangram (str : string) : bool =
  let all_letters = ['a'; 'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z']
     in
  let rec check = function
  | [] -> true
  | c :: cs ->
        if String.contains str c then 
          check cs
        else
          false
        in
  check all_letters

let pangram (ls_str : string list) : bool list =
  (* Replace [] with your implementation here. *)
  List.map is_pangram ls_str