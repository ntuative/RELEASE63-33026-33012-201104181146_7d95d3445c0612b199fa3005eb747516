package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1764:String;
      
      private var var_1763:int;
      
      private var var_2424:Boolean;
      
      private var var_2423:Boolean;
      
      private var var_2422:int;
      
      private var var_2426:int;
      
      private var var_378:ICatalogPage;
      
      private var var_2428:int;
      
      private var var_2427:int;
      
      private var var_2421:int;
      
      private var var_1384:String;
      
      private var var_2425:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1764 = param2;
         this.var_1763 = param3;
         this.var_2424 = param4;
         this.var_2423 = param5;
         this.var_2422 = param6;
         this.var_2426 = param7;
         this.var_2428 = param8;
         this.var_2427 = param9;
         this.var_2421 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get extraParameter() : String
      {
         return this.var_1384;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1384 = param1;
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_192;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1763;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_378;
      }
      
      public function get priceType() : String
      {
         return Offer.const_698;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1764;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_378 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2425;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2425 = param1;
      }
   }
}
