package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1884:int;
      
      private var var_2606:int;
      
      private var var_766:int;
      
      private var var_540:Number;
      
      private var var_2608:Boolean;
      
      private var var_2607:int;
      
      private var var_1883:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_540);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2606 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2607 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2608 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_766;
         if(this.var_766 == 1)
         {
            this.var_540 = param1;
            this.var_1884 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_766);
            this.var_540 = this.var_540 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2608 && param3 - this.var_1884 >= this.var_2606)
         {
            this.var_766 = 0;
            if(this.var_1883 < this.var_2607)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1883;
               this.var_1884 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
