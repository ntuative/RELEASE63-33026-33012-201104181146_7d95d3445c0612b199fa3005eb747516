package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1978:int = 1;
      
      public static const const_1855:int = 2;
      
      public static const const_1914:int = 3;
      
      public static const const_1952:int = 4;
      
      public static const const_1611:int = 5;
      
      public static const const_2031:int = 6;
      
      public static const const_1559:int = 7;
      
      public static const const_1493:int = 8;
      
      public static const const_2017:int = 9;
      
      public static const const_1572:int = 10;
      
      public static const const_1523:int = 11;
      
      public static const const_1560:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1618:int;
      
      private var var_1440:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1618 = param1.readInteger();
         this.var_1440 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1618;
      }
      
      public function get info() : String
      {
         return this.var_1440;
      }
   }
}
