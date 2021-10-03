package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_392:int;
      
      private var var_2364:int;
      
      private var var_2859:Boolean;
      
      private var var_2149:int;
      
      private var _ownerName:String;
      
      private var var_125:RoomData;
      
      private var var_798:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_392 = param1.readInteger();
         this.var_2364 = param1.readInteger();
         this.var_2859 = param1.readBoolean();
         this.var_2149 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_125 = new RoomData(param1);
         this.var_798 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_125 != null)
         {
            this.var_125.dispose();
            this.var_125 = null;
         }
         if(this.var_798 != null)
         {
            this.var_798.dispose();
            this.var_798 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_392;
      }
      
      public function get userCount() : int
      {
         return this.var_2364;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2859;
      }
      
      public function get ownerId() : int
      {
         return this.var_2149;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_125;
      }
      
      public function get event() : RoomData
      {
         return this.var_798;
      }
   }
}
