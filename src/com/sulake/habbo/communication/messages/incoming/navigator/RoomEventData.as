package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1309:Boolean;
      
      private var var_2221:int;
      
      private var var_2216:String;
      
      private var var_392:int;
      
      private var var_2220:int;
      
      private var var_2217:String;
      
      private var var_2219:String;
      
      private var var_2218:String;
      
      private var var_879:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_879 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1309 = false;
            return;
         }
         this.var_1309 = true;
         this.var_2221 = int(_loc2_);
         this.var_2216 = param1.readString();
         this.var_392 = int(param1.readString());
         this.var_2220 = param1.readInteger();
         this.var_2217 = param1.readString();
         this.var_2219 = param1.readString();
         this.var_2218 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_879.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_879 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2221;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2216;
      }
      
      public function get flatId() : int
      {
         return this.var_392;
      }
      
      public function get eventType() : int
      {
         return this.var_2220;
      }
      
      public function get eventName() : String
      {
         return this.var_2217;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2219;
      }
      
      public function get creationTime() : String
      {
         return this.var_2218;
      }
      
      public function get tags() : Array
      {
         return this.var_879;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1309;
      }
   }
}
