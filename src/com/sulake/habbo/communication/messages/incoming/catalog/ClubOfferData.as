package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1764:String;
      
      private var var_1763:int;
      
      private var var_2424:Boolean;
      
      private var var_2423:Boolean;
      
      private var var_2422:int;
      
      private var var_2426:int;
      
      private var var_2428:int;
      
      private var var_2427:int;
      
      private var var_2421:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1764 = param1.readString();
         this.var_1763 = param1.readInteger();
         this.var_2424 = param1.readBoolean();
         this.var_2423 = param1.readBoolean();
         this.var_2422 = param1.readInteger();
         this.var_2426 = param1.readInteger();
         this.var_2428 = param1.readInteger();
         this.var_2427 = param1.readInteger();
         this.var_2421 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1764;
      }
      
      public function get price() : int
      {
         return this.var_1763;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2424;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2423;
      }
      
      public function get periods() : int
      {
         return this.var_2422;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2426;
      }
      
      public function get year() : int
      {
         return this.var_2428;
      }
      
      public function get month() : int
      {
         return this.var_2427;
      }
      
      public function get day() : int
      {
         return this.var_2421;
      }
   }
}
