package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2197:String;
      
      private var var_2331:int;
      
      private var var_2196:int;
      
      private var var_2332:String;
      
      private var var_2333:int;
      
      private var var_1977:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2197 = param1.readString();
         this.var_2331 = param1.readInteger();
         this.var_2196 = param1.readInteger();
         this.var_2332 = param1.readString();
         this.var_2333 = param1.readInteger();
         this.var_1977 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2197;
      }
      
      public function get unitPort() : int
      {
         return this.var_2331;
      }
      
      public function get worldId() : int
      {
         return this.var_2196;
      }
      
      public function get castLibs() : String
      {
         return this.var_2332;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2333;
      }
      
      public function get nodeId() : int
      {
         return this.var_1977;
      }
   }
}
