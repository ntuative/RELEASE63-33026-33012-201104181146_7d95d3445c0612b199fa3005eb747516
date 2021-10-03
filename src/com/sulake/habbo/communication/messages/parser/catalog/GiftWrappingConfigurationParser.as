package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2661:Boolean;
      
      private var var_2662:int;
      
      private var var_1690:Array;
      
      private var var_742:Array;
      
      private var var_743:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2661;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2662;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1690;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_742;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_743;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1690 = [];
         this.var_742 = [];
         this.var_743 = [];
         this.var_2661 = param1.readBoolean();
         this.var_2662 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1690.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_742.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_743.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
