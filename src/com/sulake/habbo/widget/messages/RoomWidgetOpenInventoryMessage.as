package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_861:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1237:String = "inventory_effects";
      
      public static const const_1076:String = "inventory_badges";
      
      public static const const_1699:String = "inventory_clothes";
      
      public static const const_1683:String = "inventory_furniture";
       
      
      private var var_2387:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_861);
         this.var_2387 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2387;
      }
   }
}
