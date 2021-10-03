package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_145:String = "RSPE_VOTE_QUESTION";
      
      public static const const_136:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1155:String = "";
      
      private var var_1406:Array;
      
      private var var_1142:Array;
      
      private var var_2007:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1406 = [];
         this.var_1142 = [];
         super(param1,param2,param7,param8);
         this.var_1155 = param3;
         this.var_1406 = param4;
         this.var_1142 = param5;
         if(this.var_1142 == null)
         {
            this.var_1142 = [];
         }
         this.var_2007 = param6;
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
