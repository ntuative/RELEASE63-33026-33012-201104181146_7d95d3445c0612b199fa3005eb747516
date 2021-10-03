package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2224:int;
      
      private var var_1533:String;
      
      private var _objId:int;
      
      private var var_1928:int;
      
      private var _category:int;
      
      private var var_2121:String;
      
      private var var_2817:Boolean;
      
      private var var_2816:Boolean;
      
      private var var_2818:Boolean;
      
      private var var_2716:Boolean;
      
      private var var_2165:int;
      
      private var var_1404:int;
      
      private var var_2035:String = "";
      
      private var var_1798:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2224 = param1;
         this.var_1533 = param2;
         this._objId = param3;
         this.var_1928 = param4;
         this._category = param5;
         this.var_2121 = param6;
         this.var_2817 = param7;
         this.var_2816 = param8;
         this.var_2818 = param9;
         this.var_2716 = param10;
         this.var_2165 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_2035 = param1;
         this.var_1404 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2224;
      }
      
      public function get itemType() : String
      {
         return this.var_1533;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1928;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2121;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2817;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2816;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2818;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2716;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2165;
      }
      
      public function get slotId() : String
      {
         return this.var_2035;
      }
      
      public function get songId() : int
      {
         return this.var_1798;
      }
      
      public function get extra() : int
      {
         return this.var_1404;
      }
   }
}
