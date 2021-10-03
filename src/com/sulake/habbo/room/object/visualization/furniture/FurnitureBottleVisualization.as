package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1015:int = 20;
      
      private static const const_661:int = 9;
      
      private static const const_1338:int = -1;
       
      
      private var var_321:Array;
      
      private var var_842:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_321 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_842)
            {
               this.var_842 = true;
               this.var_321 = new Array();
               this.var_321.push(const_1338);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_842)
            {
               this.var_842 = false;
               this.var_321 = new Array();
               this.var_321.push(const_1015);
               this.var_321.push(const_661 + param1);
               this.var_321.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
         {
            if(this.var_321.length > 0)
            {
               super.setAnimation(this.var_321.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
