package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1123:int = 1;
      
      public static const const_785:int = 2;
      
      public static const const_924:int = 3;
      
      public static const const_1522:int = 4;
       
      
      private var _index:int;
      
      private var var_2478:String;
      
      private var var_2482:String;
      
      private var var_2479:Boolean;
      
      private var var_2480:String;
      
      private var var_937:String;
      
      private var var_2483:int;
      
      private var var_2364:int;
      
      private var _type:int;
      
      private var var_2481:String;
      
      private var var_952:GuestRoomData;
      
      private var var_953:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2478 = param1.readString();
         this.var_2482 = param1.readString();
         this.var_2479 = param1.readInteger() == 1;
         this.var_2480 = param1.readString();
         this.var_937 = param1.readString();
         this.var_2483 = param1.readInteger();
         this.var_2364 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1123)
         {
            this.var_2481 = param1.readString();
         }
         else if(this._type == const_924)
         {
            this.var_953 = new PublicRoomData(param1);
         }
         else if(this._type == const_785)
         {
            this.var_952 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_952 != null)
         {
            this.var_952.dispose();
            this.var_952 = null;
         }
         if(this.var_953 != null)
         {
            this.var_953.dispose();
            this.var_953 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2478;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2482;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2479;
      }
      
      public function get picText() : String
      {
         return this.var_2480;
      }
      
      public function get picRef() : String
      {
         return this.var_937;
      }
      
      public function get folderId() : int
      {
         return this.var_2483;
      }
      
      public function get tag() : String
      {
         return this.var_2481;
      }
      
      public function get userCount() : int
      {
         return this.var_2364;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_952;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_953;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1123)
         {
            return 0;
         }
         if(this.type == const_785)
         {
            return this.var_952.maxUserCount;
         }
         if(this.type == const_924)
         {
            return this.var_953.maxUsers;
         }
         return 0;
      }
   }
}
