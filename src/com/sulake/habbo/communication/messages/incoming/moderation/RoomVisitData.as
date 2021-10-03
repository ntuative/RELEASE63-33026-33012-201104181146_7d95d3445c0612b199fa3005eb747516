package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_1897:Boolean;
      
      private var _roomId:int;
      
      private var var_926:String;
      
      private var var_2552:int;
      
      private var var_2551:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1897 = param1.readBoolean();
         this._roomId = param1.readInteger();
         this.var_926 = param1.readString();
         this.var_2552 = param1.readInteger();
         this.var_2551 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return this.var_1897;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_926;
      }
      
      public function get enterHour() : int
      {
         return this.var_2552;
      }
      
      public function get enterMinute() : int
      {
         return this.var_2551;
      }
   }
}
