package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_75:ITextFieldWindow;
      
      private var var_628:Boolean;
      
      private var var_1596:String = "";
      
      private var var_1808:int;
      
      private var var_1807:Function;
      
      private var var_2471:String = "";
      
      private var var_135:IWindowContainer;
      
      private var var_2469:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      private var var_2470:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_75 = param2;
         this.var_1808 = param3;
         this.var_1807 = param4;
         if(param5 != null)
         {
            this.var_628 = true;
            this.var_1596 = param5;
            this.var_75.text = param5;
         }
         Util.setProcDirectly(this.var_75,this.onInputClick);
         this.var_75.addEventListener(WindowKeyboardEvent.const_172,this.checkEnterPress);
         this.var_75.addEventListener(WindowEvent.const_103,this.checkMaxLen);
         this.var_2469 = this.var_75.textBackground;
         this._orgTextBackgroundColor = this.var_75.textBackgroundColor;
         this.var_2470 = this.var_75.textColor;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_75.textBackground = this.var_2469;
         this.var_75.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_75.textColor = this.var_2470;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_75.textBackground = true;
         this.var_75.textBackgroundColor = 4294021019;
         this.var_75.textColor = 4278190080;
         if(this.var_135 == null)
         {
            this.var_135 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_135,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_75.parent).addChild(this.var_135);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_135.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_135.findChildByName("border").width = _loc2_.width + 15;
         this.var_135.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_75.getLocalPosition(_loc3_);
         this.var_135.x = _loc3_.x;
         this.var_135.y = _loc3_.y - this.var_135.height + 3;
         var _loc4_:IWindow = this.var_135.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_135.width / 2 - _loc4_.width / 2;
         this.var_135.x += (this.var_75.width - this.var_135.width) / 2;
         this.var_135.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1596 != null)
         {
            this.var_75.text = this.var_1596;
            this.var_628 = true;
         }
         else
         {
            this.var_75.text = "";
            this.var_628 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_628)
         {
            return this.var_2471;
         }
         return this.var_75.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_628 = false;
         this.var_75.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_135 != null)
         {
            this.var_135.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_75;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_628 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_290)
         {
            return;
         }
         if(!this.var_628)
         {
            return;
         }
         this.var_75.text = this.var_2471;
         this.var_628 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:WindowKeyboardEvent) : void
      {
         if(param1.charCode == Keyboard.ENTER)
         {
            if(this.var_1807 != null)
            {
               this.var_1807();
            }
         }
      }
      
      private function checkMaxLen(param1:WindowEvent) : void
      {
         var _loc2_:String = this.var_75.text;
         if(_loc2_.length > this.var_1808)
         {
            this.var_75.text = _loc2_.substring(0,this.var_1808);
         }
      }
   }
}
