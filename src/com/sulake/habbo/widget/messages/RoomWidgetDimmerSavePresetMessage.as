package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_923:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2321:int;
      
      private var var_2319:int;
      
      private var _color:uint;
      
      private var var_1231:int;
      
      private var var_2883:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_923);
         this.var_2321 = param1;
         this.var_2319 = param2;
         this._color = param3;
         this.var_1231 = param4;
         this.var_2883 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2321;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2319;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1231;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2883;
      }
   }
}
