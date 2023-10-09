open Gg
open Vg

(* 1. Define your image *)

(* let gray = I.const (Color.gray 0.5) *)
let size = Size2.v 100. 100. 
let view = Box2.unit 
(* let view = Box2.v P2.o (Size2.v 26. 26.) *)
let white = I.const Color.white
(* let colors = [|I.const (Color.v_srgb 0.5 0.8 0.5); I.const (Color.v_srgb 0. 0.39 0.5); I.const (Color.v_srgb 0.5 0.2 0.9); |] *)
(* let circle x y r = P.empty |> P.circle (P2.v x y) r *)
(* let gray_circle (x,y ) = (I.cut circle gray) |> I.move (P2.v x y) *)



(*
let sqr_p o sz basis = 
  let v1, v2 = (V2.smul sz (M2.col 0 basis)), (V2.smul sz (M2.col 1 basis)) in
  let top_r = V2.add o v2 in
  let top_l = V2.add top_r v1 in
  let bottom_r = V2.add o v1 in
  P.empty |> P.sub o |> P.line (top_r) |> P.line (top_l)
                   |> P.line bottom_r |> P.line o 
                  
let p_to_img p color = 
    let area = `O { P.o with P.width = 0.01;  } in
      color  |> I.const |> I.cut ~area p 

      *)
(* let sqr_img o sz basis = p_to_img (sqr_p o sz basis) Color.white *)

let () =
  
  let warn w = Vgr.pp_warning Format.err_formatter w in
  let r = Vgr.create ~warn (Vgr_svg.target ()) (`Channel stdout) in
    (* let sqr c s = I.scale (V2.v s s) (to_img (I.const c)  box_unit)  in *)
    (* let _ = I.blend sqr image in *)
    let open Fractals2d in 
    let img = Carpet.make white 5  in 
  (* let mv_up m img = I.move (V2.v 0. m) img in *)
  (* let blue =  mv_up 0.5 (mv 0. (sqr Color.blue 0.25))  in *)
  (* let _ = mv 0.25 (sqr Color.red 0.5) in
  let sq = sqr_img (V2.v trd 0.) trd M2.id in
  let sq1 = sqr_img (V2.v trd 0.) trd (M2.rot2 Float.pi_div_4)
     *)

  (* let i = I.blend (I.blend  sq sq1) (I.const Color.black)   in   *)
  ignore (Vgr.render r (`Image (size, view, img )));
  ignore (Vgr.render r `End)