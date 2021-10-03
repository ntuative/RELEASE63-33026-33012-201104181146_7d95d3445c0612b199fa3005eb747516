package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1975:int;
      
      private var var_2195:String;
      
      private var var_1585:int;
      
      private var var_1281:int;
      
      private var var_1752:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1975 = param1.readInteger();
         this.var_2195 = param1.readString();
         this.var_1585 = param1.readInteger();
         this.var_1281 = param1.readInteger();
         this.var_1752 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1975;
      }
      
      public function get petName() : String
      {
         return this.var_2195;
      }
      
      public function get level() : int
      {
         return this.var_1585;
      }
      
      public function get petType() : int
      {
         return this.var_1281;
      }
      
      public function get breed() : int
      {
         return this.var_1752;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
