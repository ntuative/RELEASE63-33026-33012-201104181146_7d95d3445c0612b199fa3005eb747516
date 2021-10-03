package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2233:String;
      
      private var var_2235:Class;
      
      private var var_2234:Class;
      
      private var var_1667:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2233 = param1;
         this.var_2235 = param2;
         this.var_2234 = param3;
         if(rest == null)
         {
            this.var_1667 = new Array();
         }
         else
         {
            this.var_1667 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2233;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2235;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2234;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1667;
      }
   }
}
