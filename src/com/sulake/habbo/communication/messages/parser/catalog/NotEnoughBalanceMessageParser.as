package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1940:int = 0;
      
      private var var_1941:int = 0;
      
      private var var_1701:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1940;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1941;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1701;
      }
      
      public function flush() : Boolean
      {
         this.var_1940 = 0;
         this.var_1941 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1940 = param1.readInteger();
         this.var_1941 = param1.readInteger();
         this.var_1701 = param1.readInteger();
         return true;
      }
   }
}
