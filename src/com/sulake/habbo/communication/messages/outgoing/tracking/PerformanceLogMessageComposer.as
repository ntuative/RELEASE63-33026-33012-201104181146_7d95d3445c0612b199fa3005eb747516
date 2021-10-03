package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2616:int = 0;
      
      private var var_1496:String = "";
      
      private var var_1896:String = "";
      
      private var var_2625:String = "";
      
      private var var_2857:String = "";
      
      private var var_2049:int = 0;
      
      private var var_2856:int = 0;
      
      private var var_2854:int = 0;
      
      private var var_1497:int = 0;
      
      private var var_2855:int = 0;
      
      private var var_1498:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2616 = param1;
         this.var_1496 = param2;
         this.var_1896 = param3;
         this.var_2625 = param4;
         this.var_2857 = param5;
         if(param6)
         {
            this.var_2049 = 1;
         }
         else
         {
            this.var_2049 = 0;
         }
         this.var_2856 = param7;
         this.var_2854 = param8;
         this.var_1497 = param9;
         this.var_2855 = param10;
         this.var_1498 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2616,this.var_1496,this.var_1896,this.var_2625,this.var_2857,this.var_2049,this.var_2856,this.var_2854,this.var_1497,this.var_2855,this.var_1498];
      }
   }
}
