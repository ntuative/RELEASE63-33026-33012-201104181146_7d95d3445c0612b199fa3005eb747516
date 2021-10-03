package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_888:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_627:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_888);
         this.var_627 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_627;
      }
   }
}
