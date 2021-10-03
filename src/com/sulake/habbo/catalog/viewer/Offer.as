package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1694:String = "pricing_model_unknown";
      
      public static const const_368:String = "pricing_model_single";
      
      public static const const_426:String = "pricing_model_multi";
      
      public static const const_606:String = "pricing_model_bundle";
      
      public static const const_1554:String = "price_type_none";
      
      public static const const_698:String = "price_type_credits";
      
      public static const const_1236:String = "price_type_activitypoints";
      
      public static const const_1246:String = "price_type_credits_and_activitypoints";
       
      
      private var var_745:String;
      
      private var var_1126:String;
      
      private var _offerId:int;
      
      private var var_1702:String;
      
      private var var_1124:int;
      
      private var var_1125:int;
      
      private var var_1701:int;
      
      private var var_378:ICatalogPage;
      
      private var var_599:IProductContainer;
      
      private var var_2294:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this._offerId = param1;
         this.var_1702 = param2;
         this.var_1124 = param3;
         this.var_1125 = param4;
         this.var_1701 = param5;
         this.var_378 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_378;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get localizationId() : String
      {
         return this.var_1702;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1124;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1125;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1701;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_599;
      }
      
      public function get pricingModel() : String
      {
         return this.var_745;
      }
      
      public function get priceType() : String
      {
         return this.var_1126;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2294;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2294 = param1;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1702 = "";
         this.var_1124 = 0;
         this.var_1125 = 0;
         this.var_1701 = 0;
         this.var_378 = null;
         if(this.var_599 != null)
         {
            this.var_599.dispose();
            this.var_599 = null;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_745)
         {
            case const_368:
               this.var_599 = new SingleProductContainer(this,param1);
               break;
            case const_426:
               this.var_599 = new MultiProductContainer(this,param1);
               break;
            case const_606:
               this.var_599 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_745);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_745 = const_368;
            }
            else
            {
               this.var_745 = const_426;
            }
         }
         else if(param1.length > 1)
         {
            this.var_745 = const_606;
         }
         else
         {
            this.var_745 = const_1694;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1124 > 0 && this.var_1125 > 0)
         {
            this.var_1126 = const_1246;
         }
         else if(this.var_1124 > 0)
         {
            this.var_1126 = const_698;
         }
         else if(this.var_1125 > 0)
         {
            this.var_1126 = const_1236;
         }
         else
         {
            this.var_1126 = const_1554;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_378.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_599.products)
         {
            _loc4_ = this.var_378.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
