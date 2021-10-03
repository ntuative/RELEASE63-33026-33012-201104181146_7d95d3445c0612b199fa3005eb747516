package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
   import com.sulake.habbo.friendbar.view.utils.Icon;
   import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_979:int = 127;
      
      private static const const_442:int = 1;
      
      private static const const_1299:int = 3;
      
      private static var var_714:int = 3;
      
      private static const const_978:int = 3;
      
      private static const const_1302:Boolean = false;
      
      private static const const_1300:String = "bar_xml";
      
      private static const const_1305:String = "toggle_xml";
      
      private static const const_66:String = "container";
      
      private static const const_1304:String = "border";
      
      private static const const_356:String = "list";
      
      private static const const_720:String = "header";
      
      private static const const_635:String = "canvas";
      
      private static const const_1286:String = "icon";
      
      private static const const_976:String = "button_left";
      
      private static const const_977:String = "button_right";
      
      private static const BUTTON_LEFT_PAGE:String = "button_left_page";
      
      private static const const_1303:String = "button_right_page";
      
      private static const const_1301:String = "button_left_end";
      
      private static const const_1296:String = "button_right_end";
      
      private static const const_1282:String = "button_close";
      
      private static const const_1297:String = "button_open";
      
      private static const const_1298:String = "messenger";
      
      private static const const_975:String = "friendlist";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1091:IAvatarRenderManager;
      
      private var var_97:IHabboFriendBarData;
      
      private var var_44:IWindowContainer;
      
      private var var_197:IWindowContainer;
      
      private var var_196:Vector.<ITab>;
      
      private var var_1351:ITab;
      
      private var var_1090:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1353:TextCropper;
      
      private var var_890:FriendListIcon;
      
      private var var_891:MessengerIcon;
      
      private var var_1352:Boolean = false;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1353 = new TextCropper();
         this.var_196 = new Vector.<ITab>();
         if(param1 is HabboFriendBar)
         {
            this.var_1352 = HabboFriendBar(param1).findFriendsEnabled;
         }
         if(param2 == 0)
         {
            var_714 = 83;
         }
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_442).getDesktopWindow().removeEventListener(WindowEvent.const_41,this.onDesktopResized);
            if(this.var_891)
            {
               this.var_891.dispose();
               this.var_891 = null;
            }
            if(this.var_890)
            {
               this.var_890.dispose();
               this.var_890 = null;
            }
            if(this.var_197)
            {
               this.var_197.dispose();
               this.var_197 = null;
            }
            if(this.var_44)
            {
               this.var_44.dispose();
               this.var_44 = null;
            }
            while(this.var_196.length > 0)
            {
               ITab(this.var_196.pop()).dispose();
            }
            if(this.var_97)
            {
               this.var_97.events.removeEventListener(FriendBarUpdateEvent.const_723,this.onRefreshView);
               this.var_97 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1091)
            {
               this.var_1091 = null;
               release(new IIDAvatarRenderManager());
            }
            this.var_1353.dispose();
            this.var_1353 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_44)
         {
            this.var_44.visible = param1;
            this.var_44.activate();
         }
         if(this.var_197)
         {
            this.var_197.visible = !param1;
            if(this.var_44)
            {
               this.var_197.x = this.var_44.x;
               this.var_197.y = this.var_44.y;
               this.var_197.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_44 && this.var_44.visible;
      }
      
      public function populate() : void
      {
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc1_:int = this.var_1090;
         this.deSelect();
         var _loc2_:IWindowContainer = this.var_44.findChildByName(const_66) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_356) as IItemListWindow;
         _loc3_.autoArrangeItems = false;
         var _loc4_:int = _loc3_.numListItems;
         _loc5_ = _loc4_;
         while(_loc5_ > 0)
         {
            _loc3_.removeListItemAt(_loc5_ - 1);
            _loc5_--;
         }
         while(this.var_196.length > 0)
         {
            this.var_196.pop().recycle();
         }
         var _loc6_:int = this.var_97.numFriends + (!!this.var_1352 ? 1 : 0);
         var _loc7_:int = Math.min(this.maxNumOfTabsVisible,_loc6_);
         if(this._startIndex + _loc7_ > _loc6_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc7_ - _loc6_));
         }
         _loc4_ = Math.min(this.var_97.numFriends,this._startIndex + _loc7_);
         _loc5_ = this._startIndex;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = this.var_97.getFriendAt(_loc5_);
            _loc9_ = FriendEntityTab.allocate(_loc8_);
            this.var_196.push(_loc9_);
            _loc3_.addListItem(_loc9_.window);
            _loc5_++;
         }
         if(this.var_1352)
         {
            if(this.var_196.length < this.maxNumOfTabsVisible)
            {
               _loc10_ = new AddFriendsEntityTab();
               _loc3_.addListItem(_loc10_.window);
               this.var_196.push(_loc10_);
            }
         }
         _loc3_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         _loc2_.visible = this.var_196.length > 0;
         this.toggleArrowButtons(this.var_196.length < _loc6_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_196.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_196[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function getEntityTabByWindow(param1:IWindow) : ITab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_196.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_196[_loc4_];
            if(_loc2_.window == param1)
            {
               return _loc2_;
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_97 = param2 as IHabboFriendBarData;
         this.var_97.events.addEventListener(FriendBarUpdateEvent.const_723,this.onRefreshView);
         this.var_97.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
         this.var_97.events.addEventListener(FriendRequestEvent.const_1197,this.onFriendRequestUpdate);
         this.var_97.events.addEventListener(NewMessageEvent.const_1053,this.onNewInstantMessage);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_44 && !this.var_44.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc2_:* = null;
         Tab.var_1070 = this.var_97;
         Tab.var_1067 = this;
         Tab.var_864 = assets;
         Tab.var_1320 = this._windowManager;
         Tab.var_2086 = this.var_1353;
         var _loc1_:IAsset = assets.getAssetByName(const_1300);
         this.var_44 = this._windowManager.buildFromXML(_loc1_.content as XML,const_442) as IWindowContainer;
         this.var_44.x = var_714;
         this.var_44.y = this.var_44.parent.height - (this.var_44.height + const_1299);
         this.var_44.width = this.var_44.parent.width - (var_714 + const_978);
         this.var_44.setParamFlag(WindowParam.const_227,true);
         this.var_44.procedure = this.barWindowEventProc;
         if(const_1302)
         {
            _loc1_ = assets.getAssetByName(const_1305);
            this.var_197 = this._windowManager.buildFromXML(_loc1_.content as XML,const_442) as IWindowContainer;
            this.var_197.x = this.var_44.x;
            this.var_197.y = this.var_44.y;
            this.var_197.setParamFlag(WindowParam.const_227,true);
            this.var_197.visible = false;
            this.var_197.procedure = this.toggleWindowEventProc;
         }
         _loc2_ = IWindowContainer(this.var_44.findChildByName(const_975));
         _loc2_.visible = false;
         _loc2_ = IWindowContainer(this.var_44.findChildByName(const_1298));
         _loc2_.visible = false;
         this.visible = true;
         this._windowManager.getWindowContext(const_442).getDesktopWindow().addEventListener(WindowEvent.const_41,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1091 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_1091)
            {
               _loc3_ = this.var_1091.createAvatarImage(param1,AvatarScaleType.const_53,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_51);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_44.findChildByName(const_356) as IItemListWindow;
         var _loc4_:int = this.var_97.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_97.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_356) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_720));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_635) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_;
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_1090 == param1.id;
      }
      
      public function selectTab(param1:ITab) : void
      {
         if(!param1.selected)
         {
            if(this.var_1351)
            {
               this.deSelect();
            }
            param1.select();
            this.var_1351 = param1;
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_1090 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_);
            this.var_1090 = param1;
         }
      }
      
      public function deSelect() : void
      {
         if(this.var_1351)
         {
            this.var_1351.deselect();
            this.var_1090 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_540);
      }
      
      private function onFriendRequestUpdate(param1:FriendRequestEvent) : void
      {
         if(this.var_890)
         {
            this.var_890.notify(this.var_97.numFriendRequests > 0);
         }
      }
      
      private function onNewInstantMessage(param1:NewMessageEvent) : void
      {
         if(this.var_891)
         {
            this.var_891.notify(true);
         }
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.const_42)
         {
            _loc3_ = this._startIndex;
            switch(param2.name)
            {
               case const_976:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case BUTTON_LEFT_PAGE:
                  _loc3_ = Math.max(0,this._startIndex - this.numTabsVisibleAtCurrentSize);
                  break;
               case const_1301:
                  _loc3_ = 0;
                  break;
               case const_977:
                  _loc3_ = Math.max(0,Math.min(this.var_97.numFriends - this.numTabsVisibleAtCurrentSize,this._startIndex + 1));
                  break;
               case const_1303:
                  _loc3_ = Math.max(0,Math.min(this.var_97.numFriends - this.numTabsVisibleAtCurrentSize,this._startIndex + this.numTabsVisibleAtCurrentSize));
                  break;
               case const_1296:
                  _loc3_ = Math.max(0,this.var_97.numFriends - this.numTabsVisibleAtCurrentSize);
                  break;
               case const_1282:
                  this.visible = false;
                  break;
               case const_1304:
                  this.deSelect();
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect();
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_455)
         {
            this.deSelect();
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:Icon = param1.window.name == const_975 ? this.var_890 : this.var_891;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_loc2_ is FriendListIcon)
               {
                  this.var_97.toggleFriendList();
                  _loc2_.notify(false);
               }
               else if(_loc2_ is MessengerIcon)
               {
                  this.var_97.openMessenger();
                  _loc2_.notify(false);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc2_.hover(true);
               break;
            case WindowMouseEvent.const_25:
               _loc2_.hover(false);
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_197.visible)
         {
            if(param1.type == WindowMouseEvent.const_42)
            {
               switch(param2.name)
               {
                  case const_1297:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean) : void
      {
         this.var_44.findChildByName(const_977).visible = param1;
         this.var_44.findChildByName(const_976).visible = param1;
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_44)
            {
               this.var_44.width = this.var_44.parent.width - (var_714 + const_978);
               _loc2_ = Math.min(this.maxNumOfTabsVisible,this.var_97.numFriends + (!!this.var_1352 ? 1 : 0));
               if(this.var_196.length != _loc2_ || param1)
               {
                  this.populate();
               }
            }
         }
      }
      
      private function get numTabsVisibleAtCurrentSize() : int
      {
         var _loc1_:IItemListWindow = this.var_44.findChildByName(const_356) as IItemListWindow;
         return _loc1_.width / (const_979 + _loc1_.spacing);
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IWindowContainer = this.var_44.findChildByName(const_66) as IWindowContainer;
         var _loc2_:IWindowContainer = _loc1_.getChildByName("wrapper") as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_356) as IItemListWindow;
         var _loc4_:int = _loc2_.width - _loc3_.width;
         return (_loc1_.width - _loc4_) / (const_979 + _loc3_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
