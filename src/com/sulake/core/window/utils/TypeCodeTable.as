package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_958;
         param1["bitmap"] = const_883;
         param1["border"] = const_906;
         param1["border_notify"] = const_1562;
         param1["button"] = const_500;
         param1["button_thick"] = const_754;
         param1["button_icon"] = const_1621;
         param1["button_group_left"] = const_687;
         param1["button_group_center"] = const_891;
         param1["button_group_right"] = const_874;
         param1["canvas"] = const_737;
         param1["checkbox"] = const_738;
         param1["closebutton"] = const_1141;
         param1["container"] = const_424;
         param1["container_button"] = const_774;
         param1["display_object_wrapper"] = const_858;
         param1["dropmenu"] = const_593;
         param1["dropmenu_item"] = const_506;
         param1["frame"] = const_397;
         param1["frame_notify"] = const_1770;
         param1["header"] = const_876;
         param1["html"] = const_1179;
         param1["icon"] = const_1088;
         param1["itemgrid"] = const_1097;
         param1["itemgrid_horizontal"] = const_520;
         param1["itemgrid_vertical"] = const_724;
         param1["itemlist"] = const_1051;
         param1["itemlist_horizontal"] = const_384;
         param1["itemlist_vertical"] = const_391;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1601;
         param1["menu"] = const_1658;
         param1["menu_item"] = const_1638;
         param1["submenu"] = const_1195;
         param1["minimizebox"] = const_1593;
         param1["notify"] = const_1545;
         param1["null"] = const_685;
         param1["password"] = const_799;
         param1["radiobutton"] = const_825;
         param1["region"] = const_620;
         param1["restorebox"] = const_1701;
         param1["scaler"] = const_529;
         param1["scaler_horizontal"] = const_1689;
         param1["scaler_vertical"] = const_1595;
         param1["scrollbar_horizontal"] = const_479;
         param1["scrollbar_vertical"] = const_780;
         param1["scrollbar_slider_button_up"] = const_1253;
         param1["scrollbar_slider_button_down"] = const_1245;
         param1["scrollbar_slider_button_left"] = const_1130;
         param1["scrollbar_slider_button_right"] = const_1257;
         param1["scrollbar_slider_bar_horizontal"] = const_1117;
         param1["scrollbar_slider_bar_vertical"] = const_1171;
         param1["scrollbar_slider_track_horizontal"] = const_1243;
         param1["scrollbar_slider_track_vertical"] = const_1264;
         param1["scrollable_itemlist"] = const_1609;
         param1["scrollable_itemlist_vertical"] = const_536;
         param1["scrollable_itemlist_horizontal"] = const_1153;
         param1["selector"] = const_915;
         param1["selector_list"] = const_941;
         param1["submenu"] = const_1195;
         param1["tab_button"] = const_691;
         param1["tab_container_button"] = const_1110;
         param1["tab_context"] = const_366;
         param1["tab_content"] = const_1074;
         param1["tab_selector"] = const_762;
         param1["text"] = const_550;
         param1["input"] = const_736;
         param1["toolbar"] = const_1495;
         param1["tooltip"] = const_409;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
