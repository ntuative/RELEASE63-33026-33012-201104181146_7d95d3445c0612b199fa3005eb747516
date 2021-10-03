package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1155:String;
      
      private var var_1406:Array;
      
      private var var_1142:Array;
      
      private var var_2007:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1155;
      }
      
      public function get choices() : Array
      {
         return this.var_1406.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1142.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2007;
      }
      
      public function flush() : Boolean
      {
         this.var_1155 = "";
         this.var_1406 = [];
         this.var_1142 = [];
         this.var_2007 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1155 = param1.readString();
         this.var_1406 = [];
         this.var_1142 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1406.push(param1.readString());
            this.var_1142.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2007 = param1.readInteger();
         return true;
      }
   }
}
