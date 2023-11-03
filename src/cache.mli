open Optint
open Container_image_spec

type t

val v : [ `Dir ] Eio.Path.t -> t
val init : t -> unit

module Blob : sig
  val exists : t -> size:Int63.t -> Digest.t -> bool

  val add_fd :
    sw:Eio.Switch.t -> t -> Digest.t -> Eio.Flow.source_ty Flow.t -> unit

  val get_fd : sw:Eio.Switch.t -> t -> Digest.t -> Eio.File.ro_ty Eio.Resource.t
  val add_string : sw:Eio.Switch.t -> t -> Digest.t -> string -> unit
  val get_string : t -> Digest.t -> string
end

module Manifest : sig
  val exists : t -> Image.t -> bool
  val get : t -> Image.t -> Manifest.t
  val add : sw:Eio.Switch.t -> t -> Image.t -> Manifest.t -> unit
  val list : t -> Image.t list
end
