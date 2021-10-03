package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_151:Number = 0;
      
      private var var_152:Number = 0;
      
      private var var_2827:Number = 0;
      
      private var var_2825:Number = 0;
      
      private var var_2826:Number = 0;
      
      private var var_2828:Number = 0;
      
      private var var_439:int = 0;
      
      private var var_2604:int = 0;
      
      private var var_330:Array;
      
      private var var_2829:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_330 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_151 = param3;
         this.var_152 = param4;
         this.var_2827 = param5;
         this.var_439 = param6;
         this.var_2604 = param7;
         this.var_2825 = param8;
         this.var_2826 = param9;
         this.var_2828 = param10;
         this.var_2829 = param11;
         this.var_330 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_151;
      }
      
      public function get z() : Number
      {
         return this.var_152;
      }
      
      public function get localZ() : Number
      {
         return this.var_2827;
      }
      
      public function get targetX() : Number
      {
         return this.var_2825;
      }
      
      public function get targetY() : Number
      {
         return this.var_2826;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2828;
      }
      
      public function get dir() : int
      {
         return this.var_439;
      }
      
      public function get dirHead() : int
      {
         return this.var_2604;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2829;
      }
      
      public function get actions() : Array
      {
         return this.var_330.slice();
      }
   }
}
