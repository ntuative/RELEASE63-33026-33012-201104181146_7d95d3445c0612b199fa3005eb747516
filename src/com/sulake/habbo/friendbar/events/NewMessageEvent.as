package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class NewMessageEvent extends Event
   {
      
      public static const const_1053:String = "FBE_MESSAGE";
       
      
      public function NewMessageEvent()
      {
         super(const_1053,false,false);
      }
   }
}
