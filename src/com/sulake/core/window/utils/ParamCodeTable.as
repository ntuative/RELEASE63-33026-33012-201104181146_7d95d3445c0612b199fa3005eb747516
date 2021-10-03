package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_211;
         param1["bound_to_parent_rect"] = const_104;
         param1["child_window"] = const_1213;
         param1["embedded_controller"] = const_1232;
         param1["resize_to_accommodate_children"] = const_72;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_669;
         param1["mouse_dragging_target"] = const_281;
         param1["mouse_dragging_trigger"] = const_434;
         param1["mouse_scaling_target"] = const_293;
         param1["mouse_scaling_trigger"] = const_546;
         param1["horizontal_mouse_scaling_trigger"] = const_239;
         param1["vertical_mouse_scaling_trigger"] = const_233;
         param1["observe_parent_input_events"] = const_1100;
         param1["optimize_region_to_layout_size"] = const_603;
         param1["parent_window"] = const_1193;
         param1["relative_horizontal_scale_center"] = const_200;
         param1["relative_horizontal_scale_fixed"] = const_152;
         param1["relative_horizontal_scale_move"] = const_392;
         param1["relative_horizontal_scale_strech"] = const_382;
         param1["relative_scale_center"] = const_1156;
         param1["relative_scale_fixed"] = const_803;
         param1["relative_scale_move"] = const_1207;
         param1["relative_scale_strech"] = const_1204;
         param1["relative_vertical_scale_center"] = const_207;
         param1["relative_vertical_scale_fixed"] = const_158;
         param1["relative_vertical_scale_move"] = const_227;
         param1["relative_vertical_scale_strech"] = const_324;
         param1["on_resize_align_left"] = const_814;
         param1["on_resize_align_right"] = const_571;
         param1["on_resize_align_center"] = const_574;
         param1["on_resize_align_top"] = const_805;
         param1["on_resize_align_bottom"] = const_590;
         param1["on_resize_align_middle"] = const_464;
         param1["on_accommodate_align_left"] = const_1089;
         param1["on_accommodate_align_right"] = const_592;
         param1["on_accommodate_align_center"] = const_841;
         param1["on_accommodate_align_top"] = const_1068;
         param1["on_accommodate_align_bottom"] = const_617;
         param1["on_accommodate_align_middle"] = const_898;
         param1["route_input_events_to_parent"] = const_591;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1116;
         param1["scalable_with_mouse"] = const_1063;
         param1["reflect_horizontal_resize_to_parent"] = const_570;
         param1["reflect_vertical_resize_to_parent"] = const_465;
         param1["reflect_resize_to_parent"] = const_306;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1158;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
