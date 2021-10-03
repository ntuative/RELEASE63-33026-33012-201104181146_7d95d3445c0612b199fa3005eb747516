package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_64:String = "i";
      
      public static const const_80:String = "s";
      
      public static const const_212:String = "e";
       
      
      private var var_1538:String;
      
      private var var_2770:int;
      
      private var var_1265:String;
      
      private var _productCount:int;
      
      private var var_1992:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1538 = param1.readString();
         this.var_2770 = param1.readInteger();
         this.var_1265 = param1.readString();
         this._productCount = param1.readInteger();
         this.var_1992 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1538;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2770;
      }
      
      public function get extraParam() : String
      {
         return this.var_1265;
      }
      
      public function get productCount() : int
      {
         return this._productCount;
      }
      
      public function get expiration() : int
      {
         return this.var_1992;
      }
   }
}
