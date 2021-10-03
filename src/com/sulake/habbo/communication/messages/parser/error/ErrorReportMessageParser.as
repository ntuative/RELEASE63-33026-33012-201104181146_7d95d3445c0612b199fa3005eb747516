package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1618:int;
      
      private var var_1867:int;
      
      private var var_1866:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1867 = param1.readInteger();
         this.var_1618 = param1.readInteger();
         this.var_1866 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1618 = 0;
         this.var_1867 = 0;
         this.var_1866 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1618;
      }
      
      public function get messageId() : int
      {
         return this.var_1867;
      }
      
      public function get timestamp() : String
      {
         return this.var_1866;
      }
   }
}
