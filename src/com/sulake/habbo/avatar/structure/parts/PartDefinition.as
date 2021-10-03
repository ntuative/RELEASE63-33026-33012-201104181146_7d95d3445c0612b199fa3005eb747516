package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2505:String;
      
      private var var_1830:String;
      
      private var var_2506:String;
      
      private var var_1829:Boolean;
      
      private var var_1831:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2505 = String(param1["set-type"]);
         this.var_1830 = String(param1["flipped-set-type"]);
         this.var_2506 = String(param1["remove-set-type"]);
         this.var_1829 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1831 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1831;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1831 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2505;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1830;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2506;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1829;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1829 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1830 = param1;
      }
   }
}
