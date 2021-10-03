package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1289:Boolean;
      
      private var var_1290:Boolean;
      
      private var var_1576:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1289;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1290;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1576;
      }
      
      public function flush() : Boolean
      {
         this.var_1289 = false;
         this.var_1290 = false;
         this.var_1576 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1289 = param1.readBoolean();
         this.var_1290 = param1.readBoolean();
         this.var_1576 = param1.readBoolean();
         return true;
      }
   }
}
