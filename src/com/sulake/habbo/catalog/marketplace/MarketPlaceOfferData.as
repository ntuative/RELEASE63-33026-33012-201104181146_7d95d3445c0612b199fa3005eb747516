package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2636:int;
      
      private var var_2121:String;
      
      private var var_1763:int;
      
      private var var_2179:int;
      
      private var var_2758:int;
      
      private var var_402:int;
      
      private var var_2637:int = -1;
      
      private var var_1988:int;
      
      private var var_48:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2636 = param3;
         this.var_2121 = param4;
         this.var_1763 = param5;
         this.var_402 = param6;
         this.var_2179 = param7;
         this.var_1988 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_48)
         {
            this.var_48.dispose();
            this.var_48 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2636;
      }
      
      public function get stuffData() : String
      {
         return this.var_2121;
      }
      
      public function get price() : int
      {
         return this.var_1763;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2179;
      }
      
      public function get image() : BitmapData
      {
         return this.var_48;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_48 != null)
         {
            this.var_48.dispose();
         }
         this.var_48 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2758 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2758;
      }
      
      public function get status() : int
      {
         return this.var_402;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2637;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2637 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1763 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1988;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1988 = param1;
      }
   }
}
