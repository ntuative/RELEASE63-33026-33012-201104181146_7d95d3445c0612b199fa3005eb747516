package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_157:String = "ROE_MOUSE_CLICK";
      
      public static const const_1967:String = "ROE_MOUSE_ENTER";
      
      public static const const_513:String = "ROE_MOUSE_MOVE";
      
      public static const const_2020:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2022:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1760:String = "";
      
      private var var_2353:Boolean;
      
      private var var_2350:Boolean;
      
      private var var_2346:Boolean;
      
      private var var_2347:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1760 = param2;
         this.var_2353 = param5;
         this.var_2350 = param6;
         this.var_2346 = param7;
         this.var_2347 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1760;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2353;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2350;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2346;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2347;
      }
   }
}
