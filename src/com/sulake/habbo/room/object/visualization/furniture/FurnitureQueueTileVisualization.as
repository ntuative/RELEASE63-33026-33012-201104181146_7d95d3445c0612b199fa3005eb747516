package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1338:int = 3;
      
      private static const const_1424:int = 2;
      
      private static const const_1423:int = 1;
      
      private static const const_1425:int = 15;
       
      
      private var var_321:Array;
      
      private var var_1223:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_321 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1424)
         {
            this.var_321 = new Array();
            this.var_321.push(const_1423);
            this.var_1223 = const_1425;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1223 > 0)
         {
            --this.var_1223;
         }
         if(this.var_1223 == 0)
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
