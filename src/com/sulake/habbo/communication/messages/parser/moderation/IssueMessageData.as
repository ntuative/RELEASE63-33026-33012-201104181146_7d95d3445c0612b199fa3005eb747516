package com.sulake.habbo.communication.messages.parser.moderation
{
   public class IssueMessageData
   {
      
      public static const const_164:int = 1;
      
      public static const const_404:int = 2;
      
      public static const const_1763:int = 3;
       
      
      private var var_2642:int;
      
      private var _state:int;
      
      private var var_1554:int;
      
      private var _reportedCategoryId:int;
      
      private var var_1628:int;
      
      private var _priority:int;
      
      private var var_2748:int = 0;
      
      private var var_2751:int;
      
      private var var_2749:String;
      
      private var var_1579:int;
      
      private var var_2042:String;
      
      private var var_2750:int;
      
      private var var_2752:String;
      
      private var _message:String;
      
      private var var_2477:int;
      
      private var var_926:String;
      
      private var var_1953:int;
      
      private var var_2754:String;
      
      private var var_392:int;
      
      private var var_2753:String;
      
      private var var_2293:String;
      
      private var var_2331:int;
      
      private var var_2196:int;
      
      public function IssueMessageData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:String, param9:int, param10:String, param11:int, param12:String, param13:String, param14:int, param15:String, param16:int, param17:String, param18:int, param19:String, param20:String, param21:int, param22:int)
      {
         super();
         this.var_2642 = param1;
         this._state = param2;
         this.var_1554 = param3;
         this._reportedCategoryId = param4;
         this.var_1628 = param5;
         this._priority = param6;
         this.var_2751 = param7;
         this.var_2749 = param8;
         this.var_1579 = param9;
         this.var_2042 = param10;
         this.var_2750 = param11;
         this.var_2752 = param12;
         this._message = param13;
         this.var_2477 = param14;
         this.var_926 = param15;
         this.var_1953 = param16;
         this.var_2754 = param17;
         this.var_392 = param18;
         this.var_2753 = param19;
         this.var_2293 = param20;
         this.var_2331 = param21;
         this.var_2196 = param22;
      }
      
      public function get issueId() : int
      {
         return this.var_2642;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get categoryId() : int
      {
         return this.var_1554;
      }
      
      public function get reportedCategoryId() : int
      {
         return this._reportedCategoryId;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1628;
      }
      
      public function get priority() : int
      {
         return this._priority + this.var_2748;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2751;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2749;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1579;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_2042;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2750;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2752;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2477;
      }
      
      public function get roomName() : String
      {
         return this.var_926;
      }
      
      public function get roomType() : int
      {
         return this.var_1953;
      }
      
      public function get flatType() : String
      {
         return this.var_2754;
      }
      
      public function get flatId() : int
      {
         return this.var_392;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2753;
      }
      
      public function get roomResources() : String
      {
         return this.var_2293;
      }
      
      public function get unitPort() : int
      {
         return this.var_2331;
      }
      
      public function get worldId() : int
      {
         return this.var_2196;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2748 = param1;
      }
      
      public function getOpenTime(param1:int) : String
      {
         var _loc2_:int = (param1 - this.var_1628) / 1000;
         var _loc3_:int = _loc2_ % 60;
         var _loc4_:int = _loc2_ / 60;
         var _loc5_:int = _loc4_ % 60;
         var _loc6_:int = _loc4_ / 60;
         var _loc7_:String = _loc3_ < 10 ? "0" + _loc3_ : "" + _loc3_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         var _loc9_:String = _loc6_ < 10 ? "0" + _loc6_ : "" + _loc6_;
         return _loc9_ + ":" + _loc8_ + ":" + _loc7_;
      }
   }
}
