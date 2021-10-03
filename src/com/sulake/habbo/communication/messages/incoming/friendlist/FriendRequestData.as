package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1153:int;
      
      private var var_2286:String;
      
      private var var_2287:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1153 = param1.readInteger();
         this.var_2286 = param1.readString();
         this.var_2287 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1153;
      }
      
      public function get requesterName() : String
      {
         return this.var_2286;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2287;
      }
   }
}
