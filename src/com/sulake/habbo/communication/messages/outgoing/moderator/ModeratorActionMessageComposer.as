package com.sulake.habbo.communication.messages.outgoing.moderator
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class ModeratorActionMessageComposer implements IMessageComposer, IDisposable
   {
      
      public static const const_1846:int = 0;
      
      public static const const_1540:int = 1;
      
      public static const const_1706:int = 0;
      
      public static const const_1707:int = 1;
      
      public static const const_1904:int = 2;
      
      public static const const_1536:int = 3;
      
      public static const const_1484:int = 4;
       
      
      private var var_33:Array;
      
      public function ModeratorActionMessageComposer(param1:int, param2:int, param3:String, param4:String, param5:String, param6:int = 0)
      {
         this.var_33 = new Array();
         super();
         this.var_33.push(param1);
         this.var_33.push(param2);
         this.var_33.push(param3);
         this.var_33.push(param4);
         this.var_33.push(param5);
         this.var_33.push(param6);
         this.var_33.push(false);
         this.var_33.push(false);
      }
      
      public function getMessageArray() : Array
      {
         return this.var_33;
      }
      
      public function dispose() : void
      {
         this.var_33 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
