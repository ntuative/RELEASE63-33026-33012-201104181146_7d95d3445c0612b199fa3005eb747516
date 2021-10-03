package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2337:String;
      
      private var var_2463:Array;
      
      private var var_2462:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2337 = param1;
         this.var_2463 = param2;
         this.var_2462 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2337;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2463;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2462;
      }
   }
}
