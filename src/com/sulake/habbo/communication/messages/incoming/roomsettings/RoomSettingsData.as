package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_468:int = 0;
      
      public static const const_189:int = 1;
      
      public static const const_121:int = 2;
      
      public static const const_836:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1872:String;
      
      private var var_2185:int;
      
      private var var_1554:int;
      
      private var var_2187:int;
      
      private var var_2186:int;
      
      private var var_879:Array;
      
      private var var_2183:Array;
      
      private var var_2189:int;
      
      private var var_2191:Boolean;
      
      private var var_2184:Boolean;
      
      private var var_2188:Boolean;
      
      private var var_2190:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2191;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2191 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2184;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2184 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2188;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2188 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2190;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2190 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1872;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1872 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2185;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2185 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1554;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1554 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2187;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2187 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2186;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2186 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_879;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_879 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2183;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2183 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2189;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2189 = param1;
      }
   }
}
