(* Do not put your pangram implementation in this file! Do not submit this
   file! *)

open Pangram

(** [pangram_from_file in_file out_file] reads lines from [in_file], checks if
    each line is a pangram, and writes the results to [out_file]. *)
let pangram_from_file (in_file : string) (out_file : string) : unit =
  (* Helper function: it reads input channel [ic] line by line and returns the
     result as a list of strings. *)
  let input_lines ic =
    let rec loop acc =
      (* Read a line from [ic]. *)
      match input_line ic with
      | line ->
          (* Build a new list with the read line and continue. *)
          loop (line :: acc)
      | exception End_of_file ->
          (* At the end, we reverse the accumulated list since it was built by
             adding new lines to the head of the old list. *)
          List.rev acc
    in
    (* Accumulate the result from an empty list. *)
    loop []
  in
  (* This variable contains the result of input file. Please remember this is a
     list of strings. *)
  let ls_str = In_channel.with_open_text in_file input_lines in
  (* Call your pangram function to check each line. Please remember this is a
     list of booleans *)
  let results = pangram ls_str in
  (* Helper function: it takes a list of bools and writes to the output file. *)
  let output_bools ls oc = List.iter (Printf.fprintf oc "%b\n") ls in
  Out_channel.with_open_text out_file (output_bools results)

let () =
  (* Use and modify this line to test your code. *)
  pangram_from_file "input.txt" "output_test.txt"
