package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2956:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_82 = param1.desktop;
         var_64 = param1.var_1324 as WindowController;
         var_173 = param1.var_1323 as WindowController;
         var_170 = param1.renderer;
         var_871 = param1.var_1319;
         param2.begin();
         param2.end();
         param1.desktop = var_82;
         param1.var_1324 = var_64;
         param1.var_1323 = var_173;
         param1.renderer = var_170;
         param1.var_1319 = var_871;
      }
   }
}
