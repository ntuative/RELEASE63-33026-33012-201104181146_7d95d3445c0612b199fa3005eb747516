package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1985:int;
      
      private var _currentPosition:int;
      
      private var var_1986:int;
      
      private var var_1984:int;
      
      private var var_1987:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1985;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1986;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1984;
      }
      
      public function get syncCount() : int
      {
         return this.var_1987;
      }
      
      public function flush() : Boolean
      {
         this.var_1985 = -1;
         this._currentPosition = -1;
         this.var_1986 = -1;
         this.var_1984 = -1;
         this.var_1987 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1985 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1986 = param1.readInteger();
         this.var_1984 = param1.readInteger();
         this.var_1987 = param1.readInteger();
         return true;
      }
   }
}
