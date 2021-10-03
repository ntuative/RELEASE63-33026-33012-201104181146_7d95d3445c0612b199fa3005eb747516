package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1810:int;
      
      private var var_2476:int;
      
      private var var_1579:int;
      
      private var var_2477:int;
      
      private var var_125:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1810 = param1.readInteger();
         this.var_2476 = param1.readInteger();
         this.var_1579 = param1.readInteger();
         this.var_2477 = param1.readInteger();
         this.var_125 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1810);
      }
      
      public function get callId() : int
      {
         return this.var_1810;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2476;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1579;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2477;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_125;
      }
   }
}
