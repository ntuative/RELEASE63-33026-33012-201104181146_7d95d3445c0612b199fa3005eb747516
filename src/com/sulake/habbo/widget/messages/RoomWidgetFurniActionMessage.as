package com.sulake.habbo.widget.messages
{
   import com.sulake.core.utils.Map;
   
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_791:String = "RWFUAM_ROTATE";
      
      public static const const_283:String = "RWFAM_MOVE";
      
      public static const const_937:String = "RWFAM_PICKUP";
      
      public static const const_707:String = "RWFAM_OPEN_WELCOME_GIFT";
      
      public static const const_786:String = "RWFAM_SAVE_STUFF_DATA";
       
      
      private var _furniId:int = 0;
      
      private var var_2295:int = 0;
      
      private var var_2296:Map;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int, param4:Map = null)
      {
         super(param1);
         this._furniId = param2;
         this.var_2295 = param3;
         this.var_2296 = param4;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniCategory() : int
      {
         return this.var_2295;
      }
      
      public function get objectData() : Map
      {
         return this.var_2296;
      }
   }
}
