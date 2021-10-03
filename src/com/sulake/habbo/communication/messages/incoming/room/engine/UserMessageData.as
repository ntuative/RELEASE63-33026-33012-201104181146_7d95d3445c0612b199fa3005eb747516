package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1225:String = "M";
      
      public static const const_1579:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_151:Number = 0;
      
      private var var_152:Number = 0;
      
      private var var_439:int = 0;
      
      private var _name:String = "";
      
      private var var_2529:int = 0;
      
      private var var_1004:String = "";
      
      private var var_683:String = "";
      
      private var var_2488:String = "";
      
      private var var_2485:int;
      
      private var var_2487:int = 0;
      
      private var var_2489:String = "";
      
      private var var_2490:int = 0;
      
      private var var_2486:int = 0;
      
      private var var_2530:String = "";
      
      private var var_181:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_181 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_181)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_151;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_181)
         {
            this.var_151 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_152;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_181)
         {
            this.var_152 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_439;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_181)
         {
            this.var_439 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_181)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_2529;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_181)
         {
            this.var_2529 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_1004;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_181)
         {
            this.var_1004 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_683;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_181)
         {
            this.var_683 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2488;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_181)
         {
            this.var_2488 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2485;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_181)
         {
            this.var_2485 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2487;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_181)
         {
            this.var_2487 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2489;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_181)
         {
            this.var_2489 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2490;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_181)
         {
            this.var_2490 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2486;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_181)
         {
            this.var_2486 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2530;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_181)
         {
            this.var_2530 = param1;
         }
      }
   }
}
