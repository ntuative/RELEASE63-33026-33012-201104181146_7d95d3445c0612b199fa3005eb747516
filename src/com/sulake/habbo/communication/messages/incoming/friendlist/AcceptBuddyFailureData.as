package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AcceptBuddyFailureData
   {
       
      
      private var var_898:String;
      
      private var var_1618:int;
      
      public function AcceptBuddyFailureData(param1:IMessageDataWrapper)
      {
         super();
         this.var_898 = param1.readString();
         this.var_1618 = param1.readInteger();
      }
      
      public function get senderName() : String
      {
         return this.var_898;
      }
      
      public function get errorCode() : int
      {
         return this.var_1618;
      }
   }
}
