package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1048:int;
      
      private var var_774:Boolean;
      
      private var var_2059:Boolean;
      
      private var var_683:String;
      
      private var var_1554:int;
      
      private var var_1822:String;
      
      private var var_1792:String;
      
      private var var_1793:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1793 = param3;
         this.var_1822 = param4;
         this.var_1048 = param5;
         this.var_774 = param6;
         this.var_2059 = param7;
         this.var_683 = param8;
         this.var_1554 = param9;
         this.var_1792 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_1048;
      }
      
      public function get online() : Boolean
      {
         return this.var_774;
      }
      
      public function get allowFollow() : Boolean
      {
         return this.var_2059;
      }
      
      public function get figure() : String
      {
         return this.var_683;
      }
      
      public function get categoryId() : int
      {
         return this.var_1554;
      }
      
      public function get motto() : String
      {
         return this.var_1822;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1792;
      }
      
      public function get realName() : String
      {
         return this.var_1793;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_1048 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_774 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_2059 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_683 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1554 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1822 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1792 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1793 = param1;
      }
   }
}
