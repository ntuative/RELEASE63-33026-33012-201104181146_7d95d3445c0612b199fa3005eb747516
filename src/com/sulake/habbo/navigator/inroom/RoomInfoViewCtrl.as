package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_193:IWindowContainer;
      
      private var var_2939:int;
      
      private var var_381:RoomEventViewCtrl;
      
      private var var_273:Timer;
      
      private var var_190:RoomSettingsCtrl;
      
      private var var_275:RoomThumbnailCtrl;
      
      private var var_1178:TagRenderer;
      
      private var var_320:IWindowContainer;
      
      private var var_457:IWindowContainer;
      
      private var var_837:IWindowContainer;
      
      private var var_2761:IWindowContainer;
      
      private var var_2762:IWindowContainer;
      
      private var var_1547:IWindowContainer;
      
      private var var_926:ITextWindow;
      
      private var var_1266:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_1033:ITextWindow;
      
      private var var_1539:ITextWindow;
      
      private var var_1268:ITextWindow;
      
      private var var_1029:ITextWindow;
      
      private var var_1994:ITextWindow;
      
      private var var_274:IWindowContainer;
      
      private var var_1032:IWindowContainer;
      
      private var var_1995:IWindowContainer;
      
      private var var_2217:ITextWindow;
      
      private var var_838:ITextWindow;
      
      private var var_2760:IWindow;
      
      private var var_1546:IContainerButtonWindow;
      
      private var var_1543:IContainerButtonWindow;
      
      private var var_1544:IContainerButtonWindow;
      
      private var var_1542:IContainerButtonWindow;
      
      private var var_1540:IContainerButtonWindow;
      
      private var var_1545:IContainerButtonWindow;
      
      private var var_1998:IButtonWindow;
      
      private var var_1997:IButtonWindow;
      
      private var var_1996:IButtonWindow;
      
      private var var_1030:IWindowContainer;
      
      private var var_1541:ITextWindow;
      
      private var var_1267:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_1269:IButtonWindow;
      
      private var var_1031:IButtonWindow;
      
      private var var_2759:String;
      
      private var var_2763:String;
      
      private var var_380:Boolean = true;
      
      private const const_542:int = 75;
      
      private const const_586:int = 3;
      
      private const const_518:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_381 = new RoomEventViewCtrl(this._navigator);
         this.var_190 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_275 = new RoomThumbnailCtrl(this._navigator);
         this.var_1178 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_190);
         this.var_273 = new Timer(6000,1);
         this.var_273.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.removeEventListener(HabboToolbarSetIconEvent.const_99,this.onToolbarIconState);
         }
         if(this.var_273)
         {
            this.var_273.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_273.reset();
            this.var_273 = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_273.reset();
         this.var_381.active = true;
         this.var_190.active = false;
         this.var_275.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_273.reset();
         this.var_190.load(param1);
         this.var_190.active = true;
         this.var_381.active = false;
         this.var_275.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_190.active = true;
         this.var_381.active = false;
         this.var_275.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_273.reset();
         this.var_190.active = false;
         this.var_381.active = false;
         this.var_275.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this.var_380)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_1143,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function open(param1:Boolean) : void
      {
         this.var_273.reset();
         this.var_381.active = false;
         this.var_190.active = false;
         this.var_275.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(this._navigator.data.enteredGuestRoom.flatId);
         }
         this.refresh();
         this._window.visible = true;
         if(this.var_380)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         this._window.parent.activate();
         this._window.activate();
         if(!param1)
         {
            this.var_273.start();
         }
      }
      
      public function toggle() : void
      {
         this.var_273.reset();
         this.var_381.active = false;
         this.var_190.active = false;
         this.var_275.active = false;
         this.refresh();
         if(this.var_380)
         {
            if(!this._window.visible)
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_59,HabboToolbarIconEnum.ROOMINFO,this._window,false));
               this._window.parent.activate();
            }
            else
            {
               this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_523,HabboToolbarIconEnum.ROOMINFO,this._window,false));
            }
         }
         else
         {
            this._window.visible = !this._window.visible;
            this._window.x = this._window.desktop.width - this._window.width - this.const_586;
            this._window.y = this.const_542;
         }
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         if(this.var_380)
         {
            Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info","buttons_container"],0,2);
            this._window.height = Util.getLowestPoint(this._window);
            this._window.y = this._window.desktop.height - this._window.height - 5;
            Logger.log("MAIN: " + this.var_320.rectangle + ", " + this.var_274.rectangle + ", " + this._window.rectangle);
         }
         else
         {
            Util.moveChildrenToColumn(this.var_193,["room_info","event_info","embed_info","buttons_container"],0,2);
            this.var_193.height = Util.getLowestPoint(this.var_193);
            _loc1_ = this._window.desktop.height - this._window.height - this.const_518;
            if(this._window.y > _loc1_)
            {
               this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
            }
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_320);
         if(this.var_380)
         {
            this.var_320.findChildByName("close").visible = true;
         }
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_190.refresh(this.var_320);
         this.var_275.refresh(this.var_320);
         Util.moveChildrenToColumn(this.var_320,["room_details","room_buttons"],0,2);
         this.var_320.height = Util.getLowestPoint(this.var_320);
         this.var_320.visible = true;
         Logger.log("XORP: " + this.var_457.visible + ", " + this.var_1547.visible + ", " + this.var_837.visible + ", " + this.var_837.rectangle + ", " + this.var_320.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_274);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_381.refresh(this.var_274);
         if(Util.hasVisibleChildren(this.var_274) && !(this.var_190.active || this.var_275.active))
         {
            Util.moveChildrenToColumn(this.var_274,["event_details","event_buttons"],0,2);
            this.var_274.height = Util.getLowestPoint(this.var_274);
            this.var_274.visible = true;
         }
         else
         {
            this.var_274.visible = false;
         }
         Logger.log("EVENT: " + this.var_274.visible + ", " + this.var_274.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","com.sulake.habbo.inventory.marketplace") == "InfoStandSongDiskView";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_190.active && !this.var_275.active && !this.var_381.active)
         {
            this.var_1030.visible = true;
            this.var_1267.text = this.getEmbedData();
         }
         else
         {
            this.var_1030.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_190.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_1269)
         {
            if(this.var_2759 == "exit_homeroom")
            {
               this.var_1269.caption = "${navigator.homeroom}";
            }
            else
            {
               this.var_1269.caption = "${navigator.hotelview}";
            }
         }
         if(this.var_1031)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_1031.visible = _loc1_;
            if(this.var_2763 == "0")
            {
               this.var_1031.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_1031.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_190.active || this.var_275.active)
         {
            return;
         }
         this.var_926.text = param1.roomName;
         this.var_926.height = this.var_926.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_1033.text = param1.description;
         this.var_1178.refreshTags(this.var_457,param1.tags);
         this.var_1033.visible = false;
         if(param1.description != "")
         {
            this.var_1033.height = this.var_1033.textHeight + 5;
            this.var_1033.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1543,"facebook_logo_small",_loc3_,null,0);
         this.var_1543.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1546,"thumb_up",_loc4_,null,0);
         this.var_1546.visible = _loc4_;
         this.var_1029.visible = !_loc4_;
         this.var_1994.visible = !_loc4_;
         this.var_1994.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_457,"home",param2,null,0);
         this._navigator.refreshButton(this.var_457,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_457,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_926.y,0);
         this.var_457.visible = true;
         this.var_457.height = Util.getLowestPoint(this.var_457);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_457.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_190.active || this.var_275.active)
         {
            return;
         }
         this.var_1266.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1266.height = this.var_1266.textHeight + 5;
         this.var_1539.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1539.height = this.var_1539.textHeight + 5;
         Util.moveChildrenToColumn(this.var_837,["public_space_name","public_space_desc"],this.var_1266.y,0);
         this.var_837.visible = true;
         this.var_837.height = Math.max(86,Util.getLowestPoint(this.var_837));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_381.active)
         {
            return;
         }
         this.var_2217.text = param1.eventName;
         this.var_838.text = param1.eventDescription;
         this.var_1178.refreshTags(this.var_1032,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_838.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_838.height = this.var_838.textHeight + 5;
            this.var_838.y = Util.getLowestPoint(this.var_1032) + 2;
            this.var_838.visible = true;
         }
         this.var_1032.visible = true;
         this.var_1032.height = Util.getLowestPoint(this.var_1032);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_190.active || this.var_275.active)
         {
            return;
         }
         this.var_1998.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1544.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this.var_1542.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1540.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1545.visible = this._navigator.data.canEditRoomSettings && param1;
         this.var_1547.visible = Util.hasVisibleChildren(this.var_1547);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_381.active)
         {
            return;
         }
         this.var_1997.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1996.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1995.visible = Util.hasVisibleChildren(this.var_1995);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         if(this.var_380)
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details"));
            this._window.setParamFlag(HabboWindowParam.const_62,false);
            this._window.setParamFlag(HabboWindowParam.const_1608,true);
         }
         else
         {
            this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
            this.var_193 = this._window.findChildByName("content") as IWindowContainer;
         }
         this._window.visible = false;
         this.var_320 = IWindowContainer(this.find("room_info"));
         this.var_457 = IWindowContainer(this.find("room_details"));
         this.var_837 = IWindowContainer(this.find("public_space_details"));
         this.var_2761 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2762 = IWindowContainer(this.find("rating_cont"));
         this.var_1547 = IWindowContainer(this.find("room_buttons"));
         this.var_926 = ITextWindow(this.find("room_name"));
         this.var_1266 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_1033 = ITextWindow(this.find("room_desc"));
         this.var_1539 = ITextWindow(this.find("public_space_desc"));
         this.var_1268 = ITextWindow(this.find("owner_caption"));
         this.var_1029 = ITextWindow(this.find("rating_caption"));
         this.var_1994 = ITextWindow(this.find("rating_txt"));
         this.var_274 = IWindowContainer(this.find("event_info"));
         this.var_1032 = IWindowContainer(this.find("event_details"));
         this.var_1995 = IWindowContainer(this.find("event_buttons"));
         this.var_2217 = ITextWindow(this.find("event_name"));
         this.var_838 = ITextWindow(this.find("event_desc"));
         this.var_1543 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1546 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2760 = this.find("staff_pick_button");
         this.var_1544 = IContainerButtonWindow(this.find("add_favourite_button"));
         this.var_1542 = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1540 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1545 = IContainerButtonWindow(this.find("unmake_home_button"));
         this.var_1998 = IButtonWindow(this.find("room_settings_button"));
         this.var_1997 = IButtonWindow(this.find("create_event_button"));
         this.var_1996 = IButtonWindow(this.find("edit_event_button"));
         this.var_1030 = IWindowContainer(this.find("embed_info"));
         this.var_1541 = ITextWindow(this.find("embed_info_txt"));
         this.var_1267 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_1269 = IButtonWindow(this.find("exit_room_button"));
         this.var_1031 = IButtonWindow(this.find("zoom_button"));
         Util.setProcDirectly(this.var_1544,this.onAddFavouriteClick);
         Util.setProcDirectly(this.var_1542,this.onRemoveFavouriteClick);
         Util.setProcDirectly(this.var_1998,this.onRoomSettingsClick);
         Util.setProcDirectly(this.var_1540,this.onMakeHomeClick);
         Util.setProcDirectly(this.var_1545,this.onUnmakeHomeClick);
         Util.setProcDirectly(this.var_1997,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1996,this.onEventSettingsClick);
         Util.setProcDirectly(this.var_1267,this.onEmbedSrcClick);
         Util.setProcDirectly(this.var_1546,this.onThumbUp);
         Util.setProcDirectly(this.var_2760,this.onStaffPick);
         Util.setProcDirectly(this.var_1543,this.onFacebookLike);
         Util.setProcDirectly(this.var_1031,this.onZoomClick);
         Util.setProcDirectly(this.var_1269,this.onExitRoomClick);
         this._navigator.refreshButton(this.var_1544,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1542,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1540,"home",true,null,0);
         this._navigator.refreshButton(this.var_1545,"home",true,null,0);
         if(this.var_380)
         {
            this._window.findChildByName("close").procedure = this.onCloseButtonClick;
         }
         else
         {
            this._window.findChildByTag("close").procedure = this.onCloseButtonClick;
         }
         Util.setProcDirectly(this.var_320,this.onHover);
         Util.setProcDirectly(this.var_274,this.onHover);
         this.var_1268.width = this.var_1268.textWidth;
         Util.moveChildrenToRow(this.var_2761,["owner_caption","owner_name"],this.var_1268.x,this.var_1268.y,3);
         this.var_1029.width = this.var_1029.textWidth;
         Util.moveChildrenToRow(this.var_2762,["rating_caption","rating_txt"],this.var_1029.x,this.var_1029.y,3);
         this.var_1541.height = this.var_1541.textHeight + 5;
         Util.moveChildrenToColumn(this.var_1030,["embed_info_txt","embed_src_txt"],this.var_1541.y,2);
         this.var_1030.height = Util.getLowestPoint(this.var_1030) + 5;
         this.var_2939 = this._window.y + this._window.height;
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!this._navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this._navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function onFacebookLike(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_1267.setSelection(0,this.var_1267.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = HabboToolbarIconEnum.ZOOM;
         _loc3_.iconName = "ZOOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onExitRoomClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:HabboToolbarEvent = new HabboToolbarEvent(HabboToolbarEvent.const_36);
         _loc3_.iconId = HabboToolbarIconEnum.EXITROOM;
         _loc3_.iconName = "EXITROOM";
         this._navigator.toolbar.events.dispatchEvent(_loc3_);
      }
      
      private function onToolbarIconState(param1:HabboToolbarSetIconEvent) : void
      {
         if(param1.type != HabboToolbarSetIconEvent.const_99)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.ZOOM:
               this.var_2763 = param1.iconState;
               this.refreshButtons();
               break;
            case HabboToolbarIconEnum.EXITROOM:
               this.var_2759 = param1.iconState;
               this.refreshButtons();
         }
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         this.var_273.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         if(this.var_380)
         {
            this._navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_523,HabboToolbarIconEnum.ROOMINFO,this._window,false));
         }
         else
         {
            this._window.visible = false;
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
      
      public function registerToolbarEvents() : void
      {
         if(this._navigator.toolbar)
         {
            this._navigator.toolbar.events.addEventListener(HabboToolbarSetIconEvent.const_99,this.onToolbarIconState);
         }
      }
      
      public function handleToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(!this.var_380 || param1.type != HabboToolbarEvent.const_36)
         {
            return;
         }
         switch(param1.iconId)
         {
            case HabboToolbarIconEnum.MEMENU:
               this.close();
               break;
            case HabboToolbarIconEnum.ROOMINFO:
               this.toggle();
         }
      }
      
      public function configure() : void
      {
         if(this._navigator.configuration)
         {
            this.var_380 = this._navigator.configuration.getKey("roominfo.widget.enabled") != "1";
         }
      }
      
      public function get useToolbar() : Boolean
      {
         return this.var_380;
      }
   }
}
