package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1015:int = 20;
      
      private static const const_661:int = 10;
      
      private static const const_1393:int = 31;
      
      private static const const_1338:int = 32;
      
      private static const const_660:int = 30;
       
      
      private var var_321:Array;
      
      private var var_842:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_321 = new Array();
         super();
         super.setAnimation(const_660);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_842)
            {
               this.var_842 = true;
               this.var_321 = new Array();
               this.var_321.push(const_1393);
               this.var_321.push(const_1338);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_661)
         {
            if(this.var_842)
            {
               this.var_842 = false;
               this.var_321 = new Array();
               if(direction == 2)
               {
                  this.var_321.push(const_1015 + 5 - param1);
                  this.var_321.push(const_661 + 5 - param1);
               }
               else
               {
                  this.var_321.push(const_1015 + param1);
                  this.var_321.push(const_661 + param1);
               }
               this.var_321.push(const_660);
               return;
            }
            super.setAnimation(const_660);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
