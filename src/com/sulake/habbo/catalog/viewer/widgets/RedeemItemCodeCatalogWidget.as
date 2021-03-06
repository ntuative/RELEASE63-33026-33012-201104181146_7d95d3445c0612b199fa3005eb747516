package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.ui.Keyboard;
   
   public class RedeemItemCodeCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1046:IButtonWindow;
      
      private var var_1047:ITextFieldWindow;
      
      public function RedeemItemCodeCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(this.var_1046 != null)
         {
            this.var_1046.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onRedeem);
            this.var_1046 = null;
         }
         if(this.var_1047 != null)
         {
            this.var_1047.removeEventListener(WindowKeyboardEvent.const_172,this.windowKeyEventProcessor);
            this.var_1047 = null;
         }
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         this.var_1046 = _window.findChildByName("redeem") as IButtonWindow;
         if(this.var_1046 != null)
         {
            this.var_1046.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onRedeem);
         }
         this.var_1047 = _window.findChildByName("voucher_code") as ITextFieldWindow;
         if(this.var_1047 != null)
         {
            this.var_1047.addEventListener(WindowKeyboardEvent.const_172,this.windowKeyEventProcessor);
         }
         return true;
      }
      
      private function onRedeem(param1:WindowMouseEvent) : void
      {
         this.redeem();
      }
      
      private function windowKeyEventProcessor(param1:WindowEvent = null, param2:IWindow = null) : void
      {
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            this.redeem();
         }
      }
      
      private function redeem() : void
      {
         var voucher:String = null;
         var input:ITextFieldWindow = _window.findChildByName("voucher_code") as ITextFieldWindow;
         if(input != null)
         {
            voucher = input.text;
            if(voucher.length > 0)
            {
               page.viewer.catalog.redeemVoucher(voucher);
               input.text = "";
            }
            else
            {
               page.viewer.catalog.windowManager.alert("${catalog.voucher.empty.title}","${catalog.voucher.empty.desc}",0,function(param1:IAlertDialog, param2:WindowEvent):void
               {
                  param1.dispose();
               });
            }
         }
      }
   }
}
