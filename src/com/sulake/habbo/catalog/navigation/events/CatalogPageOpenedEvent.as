package com.sulake.habbo.catalog.navigation.events
{
   import flash.events.Event;
   
   public class CatalogPageOpenedEvent extends Event
   {
      
      public static const CATALOG_PAGE_OPENED:String = "CATALOG_PAGE_OPENED";
       
      
      private var var_1385:int;
      
      private var var_2540:String;
      
      public function CatalogPageOpenedEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(CATALOG_PAGE_OPENED,param3,param4);
         this.var_1385 = param1;
         this.var_2540 = param2;
      }
      
      public function get pageId() : int
      {
         return this.var_1385;
      }
      
      public function get method_12() : String
      {
         return this.var_2540;
      }
   }
}
