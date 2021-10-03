package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_1048:int;
      
      private var var_774:Boolean;
      
      private var var_1719:Boolean;
      
      private var var_683:String;
      
      private var var_1554:int;
      
      private var var_1822:String;
      
      private var var_1792:String;
      
      private var var_1793:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_1048 = param1.readInteger();
         this.var_774 = param1.readBoolean();
         this.var_1719 = param1.readBoolean();
         this.var_683 = param1.readString();
         this.var_1554 = param1.readInteger();
         this.var_1822 = param1.readString();
         this.var_1792 = param1.readString();
         this.var_1793 = param1.readString();
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
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1719;
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
   }
}
