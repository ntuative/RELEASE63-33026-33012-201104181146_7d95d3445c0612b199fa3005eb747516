package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_1359:Boolean;
      
      private var var_1696:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_1359;
      }
      
      public function get minutesUntilChange() : int
      {
         return this.var_1696;
      }
      
      public function flush() : Boolean
      {
         this.var_1359 = false;
         this.var_1696 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1359 = param1.readInteger() > 0;
         this.var_1696 = param1.readInteger();
         return true;
      }
   }
}
