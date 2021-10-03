package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2321:int;
      
      private var var_2319:int;
      
      private var var_2322:String;
      
      private var var_2323:int;
      
      private var var_2320:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2321 = param1;
         this.var_2319 = param2;
         this.var_2322 = param3;
         this.var_2323 = param4;
         this.var_2320 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2321,this.var_2319,this.var_2322,this.var_2323,int(this.var_2320)];
      }
      
      public function dispose() : void
      {
      }
   }
}
