package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_419:String = "RWRQUE_VISITOR_QUEUE_STATUS";
      
      public static const const_507:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
       
      
      private var var_1224:int;
      
      private var var_2443:Boolean;
      
      private var var_379:Boolean;
      
      private var var_1950:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1224 = param2;
         this.var_2443 = param3;
         this.var_379 = param4;
         this.var_1950 = param5;
      }
      
      public function get position() : int
      {
         return this.var_1224;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return this.var_2443;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_379;
      }
      
      public function get isClubQueue() : Boolean
      {
         return this.var_1950;
      }
   }
}
