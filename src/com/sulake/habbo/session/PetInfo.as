package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1975:int;
      
      private var var_1585:int;
      
      private var var_2150:int;
      
      private var var_2147:int;
      
      private var var_2154:int;
      
      private var _energy:int;
      
      private var var_2148:int;
      
      private var _nutrition:int;
      
      private var var_2152:int;
      
      private var var_2149:int;
      
      private var _ownerName:String;
      
      private var var_2248:int;
      
      private var var_511:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1975;
      }
      
      public function get level() : int
      {
         return this.var_1585;
      }
      
      public function get levelMax() : int
      {
         return this.var_2150;
      }
      
      public function get experience() : int
      {
         return this.var_2147;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2154;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2148;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2152;
      }
      
      public function get ownerId() : int
      {
         return this.var_2149;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2248;
      }
      
      public function get age() : int
      {
         return this.var_511;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1975 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1585 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2150 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2147 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2154 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2148 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2152 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2149 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2248 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_511 = param1;
      }
   }
}
