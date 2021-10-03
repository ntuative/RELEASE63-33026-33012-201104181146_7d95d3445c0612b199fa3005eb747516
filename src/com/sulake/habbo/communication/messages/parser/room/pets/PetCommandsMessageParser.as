package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_1975:int;
      
      private var var_1589:Array;
      
      private var var_1131:Array;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1975;
      }
      
      public function get allCommands() : Array
      {
         return this.var_1589;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_1131;
      }
      
      public function flush() : Boolean
      {
         this.var_1975 = -1;
         this.var_1589 = null;
         this.var_1131 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1975 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1589 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_1589.push(param1.readInteger());
         }
         var _loc3_:int = param1.readInteger();
         this.var_1131 = new Array();
         while(_loc3_-- > 0)
         {
            this.var_1131.push(param1.readInteger());
         }
         return true;
      }
   }
}
