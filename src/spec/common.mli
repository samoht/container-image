(** Basic types *)

type date_time = Ptime.t * Ptime.tz_offset_s option [@@deriving yojson]
type 'a map = (string * 'a) list [@@deriving yojson]
type env = string * string [@@deriving yojson]
type set = string list [@@deriving yojson]
type v2 [@@deriving yojson]
type rfc_6838 [@@deriving yojson]
type z = int64 [@@deriving yojson]

(** Result *)

val ( let* ) : ('a, 'b) result -> ('a -> ('c, 'b) result) -> ('c, 'b) result
val ( let+ ) : ('a, 'b) result -> ('a -> 'c) -> ('c, 'b) result

(** Errors *)

val error : ('a, Format.formatter, unit, ('b, string) result) format4 -> 'a

val error_msg :
  ('a, Format.formatter, unit, ('b, [ `Msg of string ]) result) format4 -> 'a

val unwrap : ('a, [ `Msg of string ]) result -> ('a, string) result
val wrap : ('a, string) result -> ('a, [ `Msg of string ]) result

(** JSON *)

val const_of_yojson : 'a -> string -> Yojson.Safe.t -> ('a, string) result
val pp_json : Yojson.Safe.t Fmt.t
val ( / ) : Yojson.Safe.t -> string -> (Yojson.Safe.t, string) result
val json_of_string : string -> (Yojson.Safe.t, string) result