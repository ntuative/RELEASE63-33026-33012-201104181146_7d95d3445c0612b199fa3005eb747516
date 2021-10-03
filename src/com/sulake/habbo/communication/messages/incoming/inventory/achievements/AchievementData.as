package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1585:int;
      
      private var var_324:String;
      
      private var var_2670:int;
      
      private var var_2454:int;
      
      private var var_2054:int;
      
      private var var_2669:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1585 = param1.readInteger();
         this.var_324 = param1.readString();
         this.var_2670 = param1.readInteger();
         this.var_2454 = param1.readInteger();
         this.var_2054 = param1.readInteger();
         this.var_2669 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_324;
      }
      
      public function get level() : int
      {
         return this.var_1585;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2670;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2454;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_2054;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2669;
      }
   }
}
