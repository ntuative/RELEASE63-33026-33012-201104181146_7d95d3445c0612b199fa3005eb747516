package com.sulake.habbo.notifications
{
   public class HabboNotificationItem
   {
       
      
      private var var_78:HabboNotificationItemStyle;
      
      private var var_193:String;
      
      private var var_22:HabboNotifications;
      
      public function HabboNotificationItem(param1:String, param2:HabboNotificationItemStyle, param3:HabboNotifications)
      {
         super();
         this.var_193 = param1;
         this.var_78 = param2;
         this.var_22 = param3;
      }
      
      public function get style() : HabboNotificationItemStyle
      {
         return this.var_78;
      }
      
      public function get content() : String
      {
         return this.var_193;
      }
      
      public function dispose() : void
      {
         this.var_193 = null;
         if(this.var_78 != null)
         {
            this.var_78.dispose();
            this.var_78 = null;
         }
         this.var_22 = null;
      }
      
      public function ExecuteUiLinks() : void
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_78.componentLinks;
         for each(_loc2_ in _loc1_)
         {
            if(this.var_22 != null)
            {
               this.var_22.onExecuteLink(_loc2_);
            }
         }
      }
   }
}
