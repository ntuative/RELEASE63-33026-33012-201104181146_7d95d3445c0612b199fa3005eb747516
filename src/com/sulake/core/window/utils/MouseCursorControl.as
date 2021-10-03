package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_30;
      
      private static var var_132:Stage;
      
      private static var var_300:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_755:Boolean = true;
      
      private static var var_115:DisplayObject;
      
      private static var var_1407:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_132 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_115)
            {
               var_132.removeChild(var_115);
               var_132.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_132.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_132.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_132.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_755 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_300;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_300 = param1;
         if(var_300)
         {
            if(var_115)
            {
               var_115.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_115)
         {
            var_115.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_755)
         {
            _loc1_ = var_1407[_type];
            if(_loc1_)
            {
               if(var_115)
               {
                  var_132.removeChild(var_115);
               }
               else
               {
                  var_132.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_132.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_132.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_132.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_115 = _loc1_;
               var_132.addChild(var_115);
            }
            else
            {
               if(var_115)
               {
                  var_132.removeChild(var_115);
                  var_132.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_132.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_132.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_132.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_115 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_30:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_326:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_1146:
                  case MouseCursorType.const_283:
                  case MouseCursorType.const_1724:
                  case MouseCursorType.const_1646:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_755 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1407[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_115)
         {
            var_115.x = param1.stageX - 2;
            var_115.y = param1.stageY;
            if(_type == MouseCursorType.const_30)
            {
               var_300 = false;
               Mouse.show();
            }
            else
            {
               var_300 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_115 && _type != MouseCursorType.const_30)
         {
            Mouse.hide();
            var_300 = false;
         }
      }
   }
}
