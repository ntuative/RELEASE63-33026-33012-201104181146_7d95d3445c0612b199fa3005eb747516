package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomSettingsFlatInfo
   {
      
      public static const const_468:int = 0;
      
      public static const const_189:int = 1;
      
      public static const const_121:int = 2;
      
      public static const const_836:Array = ["open","closed","password"];
       
      
      private var var_2782:Boolean;
      
      private var var_2185:int;
      
      private var _id:int;
      
      private var _ownerName:String;
      
      private var _type:String;
      
      private var _name:String;
      
      private var var_1872:String;
      
      private var var_2783:Boolean;
      
      private var var_2365:Boolean;
      
      private var var_2784:Boolean;
      
      private var _password:String;
      
      public function RoomSettingsFlatInfo()
      {
         super();
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return this.var_2782;
      }
      
      public function get doorMode() : int
      {
         return this.var_2185;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get description() : String
      {
         return this.var_1872;
      }
      
      public function get showOwnerName() : Boolean
      {
         return this.var_2783;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2365;
      }
      
      public function get categoryAlertKey() : Boolean
      {
         return this.var_2784;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         this.var_2782 = param1;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2185 = param1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1872 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         this.var_2783 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         this.var_2365 = param1;
      }
      
      public function set categoryAlertKey(param1:Boolean) : void
      {
         this.var_2784 = param1;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
   }
}
