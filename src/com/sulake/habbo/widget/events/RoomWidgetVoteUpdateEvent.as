package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_145:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_136:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1155:String;
      
      private var var_1406:Array;
      
      private var var_1142:Array;
      
      private var var_2007:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1155 = param2;
         this.var_1406 = param3;
         this.var_1142 = param4;
         if(this.var_1142 == null)
         {
            this.var_1142 = [];
         }
         this.var_2007 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1155;
      }
      
      public function get choices() : Array
      {
         return this.var_1406.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1142.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_2007;
      }
   }
}
