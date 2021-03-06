package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_367:int = 0;
      
      private var var_2073:int = 0;
      
      private var var_1739:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_367;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_2073;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_1739;
      }
      
      public function flush() : Boolean
      {
         this.var_367 = 0;
         this.var_2073 = 0;
         this.var_1739 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_367 = param1.readInteger();
         this.var_2073 = param1.readInteger();
         this.var_1739 = param1.readString();
         return true;
      }
   }
}
