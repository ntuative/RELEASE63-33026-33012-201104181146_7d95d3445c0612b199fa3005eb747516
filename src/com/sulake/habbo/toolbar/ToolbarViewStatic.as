package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class ToolbarViewStatic implements IToolbarView
   {
      
      private static const DEFAULT_LOCATION:Point = new Point(10,10);
       
      
      private var _window:IWindowContainer;
      
      private var _events:IEventDispatcher;
      
      private var _config:IHabboConfigurationManager;
      
      private var _disposed:Boolean;
      
      private var _toolbar:HabboToolbar;
      
      private var _assets:IAssetLibrary;
      
      public function ToolbarViewStatic(param1:HabboToolbar, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IConnection, param5:IEventDispatcher, param6:IHabboConfigurationManager)
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         super();
         this._toolbar = param1;
         this._assets = param3;
         this._events = param5;
         this._config = param6;
         var _loc7_:XmlAsset = param3.getAssetByName("toolbar_view_xml") as XmlAsset;
         this._window = param2.buildFromXML(_loc7_.content as XML,2) as IWindowContainer;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         this._window.position = DEFAULT_LOCATION;
         var _loc8_:Array = new Array();
         this._window.groupChildrenWithTag("ICON_BORDER",_loc8_,true);
         for each(_loc9_ in _loc8_)
         {
            if(_loc9_)
            {
               _loc9_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
            }
         }
         _loc8_ = new Array();
         this._window.groupChildrenWithTag("ICON_BMP",_loc8_,true);
         for each(_loc10_ in _loc8_)
         {
            if(_loc10_)
            {
               this.initIconImage(_loc10_.name,_loc10_);
            }
         }
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this._toolbar = null;
         this._config = null;
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function initIconImage(param1:String, param2:IBitmapWrapperWindow) : void
      {
         var _loc5_:* = null;
         var _loc3_:IAsset = this._assets.getAssetByName(param1 + "_0");
         if(!_loc3_)
         {
            Logger.log("Error, could not locate toolbar icon asset: " + param1);
            return;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         if(_loc4_)
         {
            param2.bitmap = new BitmapData(param2.width,param2.height,true,0);
            _loc5_ = new Point((param2.width - _loc4_.width) / 2,(param2.height - _loc4_.height) / 2);
            param2.bitmap.copyPixels(_loc4_,_loc4_.rect,_loc5_,null,null,true);
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:String = IWindow(param1.target).name;
         this._toolbar.toggleWindowVisibility(_loc2_);
      }
      
      public function setIconState(param1:String, param2:String) : void
      {
      }
      
      public function setIconBitmap(param1:String, param2:BitmapData) : void
      {
      }
      
      public function get barSize() : Number
      {
         return 0;
      }
      
      public function removeIcon(param1:String) : void
      {
      }
      
      public function getIconLoc(param1:String) : Point
      {
         return new Point(10,10);
      }
      
      public function getIconByMenuId(param1:String) : ToolbarIcon
      {
         return null;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Point = null) : void
      {
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer) : void
      {
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer) : void
      {
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer) : void
      {
      }
      
      public function get orientation() : String
      {
         return "LEFT";
      }
      
      public function setIcon(param1:String, param2:Boolean = true) : void
      {
      }
   }
}
