package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_683:String;
      
      private var var_1004:String;
      
      private var var_2239:String;
      
      private var var_1793:String;
      
      private var var_2240:int;
      
      private var var_2238:String;
      
      private var var_2242:int;
      
      private var var_2237:int;
      
      private var var_2158:int;
      
      private var _respectLeft:int;
      
      private var var_860:int;
      
      private var var_2241:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_683 = param1.readString();
         this.var_1004 = param1.readString();
         this.var_2239 = param1.readString();
         this.var_1793 = param1.readString();
         this.var_2240 = param1.readInteger();
         this.var_2238 = param1.readString();
         this.var_2242 = param1.readInteger();
         this.var_2237 = param1.readInteger();
         this.var_2158 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_860 = param1.readInteger();
         this.var_2241 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_683;
      }
      
      public function get sex() : String
      {
         return this.var_1004;
      }
      
      public function get customData() : String
      {
         return this.var_2239;
      }
      
      public function get realName() : String
      {
         return this.var_1793;
      }
      
      public function get tickets() : int
      {
         return this.var_2240;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2238;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2242;
      }
      
      public function get directMail() : int
      {
         return this.var_2237;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2158;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_860;
      }
      
      public function get identityId() : int
      {
         return this.var_2241;
      }
   }
}
