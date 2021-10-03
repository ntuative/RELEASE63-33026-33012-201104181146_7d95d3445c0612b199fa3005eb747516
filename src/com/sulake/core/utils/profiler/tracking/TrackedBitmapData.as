package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      private static var var_495:uint = 0;
      
      private static var var_494:uint = 0;
      
      private static const const_1800:uint = 16777215;
       
      
      private var var_469:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         super(param2,param3,param4,param5);
         ++var_495;
         var_494 += param2 * param3 * 4;
         this.var_469 = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_495;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_494;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_494 -= width * height * 4;
            --var_495;
            super.dispose();
            this._disposed = true;
            this.var_469 = null;
         }
      }
   }
}
