package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_377:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1203:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1276:String = "RWOCM_PIXELS";
      
      public static const const_1194:String = "RWOCM_CREDITS";
       
      
      private var var_2372:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_377);
         this.var_2372 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2372;
      }
   }
}
