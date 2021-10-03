package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2145:Number;
      
      private var var_1685:Number;
      
      private var var_881:Number;
      
      private var var_440:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2145 = param1;
         this.var_1685 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_881 = param1;
         this.var_440 = 0;
      }
      
      public function update() : void
      {
         this.var_881 += this.var_1685;
         this.var_440 += this.var_881;
         if(this.var_440 > 0)
         {
            this.var_440 = 0;
            this.var_881 = this.var_2145 * -1 * this.var_881;
         }
      }
      
      public function get location() : Number
      {
         return this.var_440;
      }
   }
}
