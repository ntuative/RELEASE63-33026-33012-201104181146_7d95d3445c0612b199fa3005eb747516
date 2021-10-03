package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2916:uint;
      
      private var var_147:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_255:IWindowContext;
      
      private var var_1110:IMouseDraggingService;
      
      private var var_1111:IMouseScalingService;
      
      private var var_1106:IMouseListenerService;
      
      private var var_1107:IFocusManagerService;
      
      private var var_1108:IToolTipAgentService;
      
      private var var_1109:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2916 = 0;
         this.var_147 = param2;
         this.var_255 = param1;
         this.var_1110 = new WindowMouseDragger(param2);
         this.var_1111 = new WindowMouseScaler(param2);
         this.var_1106 = new WindowMouseListener(param2);
         this.var_1107 = new FocusManager(param2);
         this.var_1108 = new WindowToolTipAgent(param2);
         this.var_1109 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1110 != null)
         {
            this.var_1110.dispose();
            this.var_1110 = null;
         }
         if(this.var_1111 != null)
         {
            this.var_1111.dispose();
            this.var_1111 = null;
         }
         if(this.var_1106 != null)
         {
            this.var_1106.dispose();
            this.var_1106 = null;
         }
         if(this.var_1107 != null)
         {
            this.var_1107.dispose();
            this.var_1107 = null;
         }
         if(this.var_1108 != null)
         {
            this.var_1108.dispose();
            this.var_1108 = null;
         }
         if(this.var_1109 != null)
         {
            this.var_1109.dispose();
            this.var_1109 = null;
         }
         this.var_147 = null;
         this.var_255 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1110;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1111;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1106;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1107;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1108;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1109;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
