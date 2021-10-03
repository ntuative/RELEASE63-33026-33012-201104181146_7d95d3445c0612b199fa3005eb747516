package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_683:String;
      
      private var var_2146:String;
      
      private var var_1048:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_683 = param1;
         this.var_1048 = param2;
         this.var_2146 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_683;
      }
      
      public function get race() : String
      {
         return this.var_2146;
      }
      
      public function get gender() : String
      {
         return this.var_1048;
      }
   }
}
