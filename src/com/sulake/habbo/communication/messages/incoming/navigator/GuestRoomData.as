package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_392:int;
      
      private var var_798:Boolean;
      
      private var var_926:String;
      
      private var _ownerName:String;
      
      private var var_2185:int;
      
      private var var_2364:int;
      
      private var var_2361:int;
      
      private var var_1872:String;
      
      private var var_2360:int;
      
      private var var_2365:Boolean;
      
      private var var_850:int;
      
      private var var_1554:int;
      
      private var var_2362:String;
      
      private var var_879:Array;
      
      private var var_2366:RoomThumbnailData;
      
      private var var_2191:Boolean;
      
      private var var_2363:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_879 = new Array();
         super();
         this.var_392 = param1.readInteger();
         this.var_798 = param1.readBoolean();
         this.var_926 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2185 = param1.readInteger();
         this.var_2364 = param1.readInteger();
         this.var_2361 = param1.readInteger();
         this.var_1872 = param1.readString();
         this.var_2360 = param1.readInteger();
         this.var_2365 = param1.readBoolean();
         this.var_850 = param1.readInteger();
         this.var_1554 = param1.readInteger();
         this.var_2362 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_879.push(_loc4_);
            _loc3_++;
         }
         this.var_2366 = new RoomThumbnailData(param1);
         this.var_2191 = param1.readBoolean();
         this.var_2363 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_392;
      }
      
      public function get event() : Boolean
      {
         return this.var_798;
      }
      
      public function get roomName() : String
      {
         return this.var_926;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2185;
      }
      
      public function get userCount() : int
      {
         return this.var_2364;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2361;
      }
      
      public function get description() : String
      {
         return this.var_1872;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2360;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2365;
      }
      
      public function get score() : int
      {
         return this.var_850;
      }
      
      public function get categoryId() : int
      {
         return this.var_1554;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2362;
      }
      
      public function get tags() : Array
      {
         return this.var_879;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2366;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2191;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2363;
      }
   }
}
