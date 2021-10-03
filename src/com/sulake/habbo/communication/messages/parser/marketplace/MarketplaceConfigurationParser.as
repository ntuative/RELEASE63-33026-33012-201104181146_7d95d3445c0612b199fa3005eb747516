package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1573:Boolean;
      
      private var var_2386:int;
      
      private var var_1869:int;
      
      private var var_1868:int;
      
      private var var_2385:int;
      
      private var var_2383:int;
      
      private var var_2384:int;
      
      private var var_2379:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1573;
      }
      
      public function get commission() : int
      {
         return this.var_2386;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1869;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1868;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2383;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2385;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2384;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2379;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1573 = param1.readBoolean();
         this.var_2386 = param1.readInteger();
         this.var_1869 = param1.readInteger();
         this.var_1868 = param1.readInteger();
         this.var_2383 = param1.readInteger();
         this.var_2385 = param1.readInteger();
         this.var_2384 = param1.readInteger();
         this.var_2379 = param1.readInteger();
         return true;
      }
   }
}
