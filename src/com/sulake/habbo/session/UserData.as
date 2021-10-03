package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_1004:String = "";
      
      private var var_683:String = "";
      
      private var var_2488:String = "";
      
      private var var_2485:int;
      
      private var var_2487:int = 0;
      
      private var var_2489:String = "";
      
      private var var_2490:int = 0;
      
      private var var_2486:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2485;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2485 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_1004;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_1004 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_683;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_683 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2488;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2488 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2487;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2487 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2489;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2489 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2490;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2490 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2486;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2486 = param1;
      }
   }
}
