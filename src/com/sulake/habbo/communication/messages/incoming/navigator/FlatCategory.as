package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1977:int;
      
      private var var_2472:String;
      
      private var var_300:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1977 = param1.readInteger();
         this.var_2472 = param1.readString();
         this.var_300 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1977;
      }
      
      public function get nodeName() : String
      {
         return this.var_2472;
      }
      
      public function get visible() : Boolean
      {
         return this.var_300;
      }
   }
}
