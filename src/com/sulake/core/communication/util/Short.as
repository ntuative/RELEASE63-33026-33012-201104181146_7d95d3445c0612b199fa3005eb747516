package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_754:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         this.var_754 = new ByteArray();
         this.var_754.writeShort(param1);
         this.var_754.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         this.var_754.position = 0;
         if(this.var_754.bytesAvailable)
         {
            _loc1_ = this.var_754.readShort();
            this.var_754.position = 0;
         }
         return _loc1_;
      }
   }
}
