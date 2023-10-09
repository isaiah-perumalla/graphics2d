open Vg
open Gg

module Carpet = struct
  let colors = [|I.const (Color.v_srgb 0.5 0.8 0.5); I.const (Color.v_srgb 0. 0.39 0.5); I.const (Color.v_srgb 0.5 0.2 0.9); |]

  let box (x,y) s = Box2.v (V2.v x y) (V2.v s s)
  let box_unit = box (0., 0.) 1.

  let to_img color b = 
    let p = P.empty |> P.rect b in 
    I.cut p color 

  let center b = 
    let v, size = Box2.o b, (Box2.w b) in
    let third = 1./.3. *. size in  
    let o = V2.add v (V2.v third third) in
      box ((V2.x o), (V2.y o)) (size /.3.)
    
    
  let successors b = 
    let x,y,size = Box2.ox b, Box2.oy b, (Box2.w b) in
    let trd = 1./.3. *. size in
    let two_trd = 2./.3. *. size in
    let pts = [(x,y); (x, y +. trd ); (x, y +. two_trd);
    (x +. trd, y); (x +. trd, y +. two_trd); 
    (x +. two_trd, y); (x +. two_trd, y +. trd); (x +. two_trd, y +. two_trd)]  in
      List.map  (fun pt -> box pt (size/. 3.)) pts 
  
  
  
  let combine color a b = I.blend  (to_img color (center b)) a
  
  let make base depth =
  
    let rec img (i,acc) b = function
    |0 -> (i, acc)
    |x -> 
      begin
        let idx = i mod (Array.length colors) in
        let new_img = combine colors.(idx) acc b  in
          List.fold_left (fun (i',acc') b' -> img (i'+1,acc') b' (x-1)) (i+1, new_img)  (successors b)
      end
    in
    let _, i = img (0,base) box_unit  depth in i 
   
  
end