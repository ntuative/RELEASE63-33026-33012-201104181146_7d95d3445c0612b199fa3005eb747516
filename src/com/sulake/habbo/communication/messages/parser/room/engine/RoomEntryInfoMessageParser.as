package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1973:Boolean;
      
      private var var_2730:int;
      
      private var var_469:Boolean;
      
      private var var_1253:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get privateRoom() : Boolean
      {
         return this.var_1973;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2730;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1253;
      }
      
      public function get owner() : Boolean
      {
         return this.var_469;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1253 != null)
         {
            this.var_1253.dispose();
            this.var_1253 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1973 = param1.readBoolean();
         if(this.var_1973)
         {
            this.var_2730 = param1.readInteger();
            this.var_469 = param1.readBoolean();
         }
         else
         {
            this.var_1253 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
