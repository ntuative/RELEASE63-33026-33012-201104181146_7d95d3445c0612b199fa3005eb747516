package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_690:String = "";
      
      public static const const_422:int = 0;
      
      public static const const_554:int = 255;
      
      public static const const_893:Boolean = false;
      
      public static const const_478:int = 0;
      
      public static const const_630:int = 0;
      
      public static const const_381:int = 0;
      
      public static const const_1164:int = 1;
      
      public static const const_1150:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2481:String = "";
      
      private var var_2010:int = 0;
      
      private var var_2215:int = 255;
      
      private var var_2535:Boolean = false;
      
      private var var_2536:int = 0;
      
      private var var_2537:int = 0;
      
      private var var_2538:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2481 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2481;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2010 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2010;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2215 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2215;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2535 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2535;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2536 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2536;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2537 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2537;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2538 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2538;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
