package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1702:String;
      
      private var var_1124:int;
      
      private var var_1125:int;
      
      private var var_1701:int;
      
      private var var_1214:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1702 = param1.readString();
         this.var_1124 = param1.readInteger();
         this.var_1125 = param1.readInteger();
         this.var_1701 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1214 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1214.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
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
      
      public function get products() : Array
      {
         return this.var_1214;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1701;
      }
   }
}
