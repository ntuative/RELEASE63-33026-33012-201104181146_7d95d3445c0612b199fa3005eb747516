package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2614:int;
      
      private var var_1791:String;
      
      private var var_2450:String;
      
      private var var_2727:Boolean;
      
      private var var_2724:Boolean;
      
      private var var_2725:int;
      
      private var var_2451:String;
      
      private var var_2726:String;
      
      private var var_1793:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2614 = param1.readInteger();
         this.var_1791 = param1.readString();
         this.var_2450 = param1.readString();
         this.var_2727 = param1.readBoolean();
         this.var_2724 = param1.readBoolean();
         param1.readString();
         this.var_2725 = param1.readInteger();
         this.var_2451 = param1.readString();
         this.var_2726 = param1.readString();
         this.var_1793 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2614;
      }
      
      public function get avatarName() : String
      {
         return this.var_1791;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2450;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2727;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2724;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2725;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2451;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2726;
      }
      
      public function get realName() : String
      {
         return this.var_1793;
      }
   }
}
