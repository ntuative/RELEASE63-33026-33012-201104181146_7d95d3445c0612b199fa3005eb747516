package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1760:String = "";
      
      private var var_1983:String = "";
      
      private var var_2354:String = "";
      
      private var var_2352:Number = 0;
      
      private var var_2348:Number = 0;
      
      private var var_2349:Number = 0;
      
      private var var_2351:Number = 0;
      
      private var var_2350:Boolean = false;
      
      private var var_2353:Boolean = false;
      
      private var var_2346:Boolean = false;
      
      private var var_2347:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1760 = param2;
         this.var_1983 = param3;
         this.var_2354 = param4;
         this.var_2352 = param5;
         this.var_2348 = param6;
         this.var_2349 = param7;
         this.var_2351 = param8;
         this.var_2350 = param9;
         this.var_2353 = param10;
         this.var_2346 = param11;
         this.var_2347 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1760;
      }
      
      public function get canvasId() : String
      {
         return this.var_1983;
      }
      
      public function get method_1() : String
      {
         return this.var_2354;
      }
      
      public function get screenX() : Number
      {
         return this.var_2352;
      }
      
      public function get screenY() : Number
      {
         return this.var_2348;
      }
      
      public function get localX() : Number
      {
         return this.var_2349;
      }
      
      public function get localY() : Number
      {
         return this.var_2351;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2350;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2353;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2346;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2347;
      }
   }
}
