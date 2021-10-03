package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1975:int;
      
      private var _name:String;
      
      private var var_1585:int;
      
      private var var_2734:int;
      
      private var var_2147:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_683:String;
      
      private var var_2733:int;
      
      private var var_2735:int;
      
      private var var_2736:int;
      
      private var var_2248:int;
      
      private var var_2149:int;
      
      private var _ownerName:String;
      
      private var var_511:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1975;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1585;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2734;
      }
      
      public function get experience() : int
      {
         return this.var_2147;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_683;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2733;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2735;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2736;
      }
      
      public function get respect() : int
      {
         return this.var_2248;
      }
      
      public function get ownerId() : int
      {
         return this.var_2149;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_511;
      }
      
      public function flush() : Boolean
      {
         this.var_1975 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1975 = param1.readInteger();
         this._name = param1.readString();
         this.var_1585 = param1.readInteger();
         this.var_2734 = param1.readInteger();
         this.var_2147 = param1.readInteger();
         this.var_2733 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2735 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2736 = param1.readInteger();
         this.var_683 = param1.readString();
         this.var_2248 = param1.readInteger();
         this.var_2149 = param1.readInteger();
         this.var_511 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
