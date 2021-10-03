package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_106:String = "me_menu_top_view";
      
      public static const const_1534:String = "me_menu_rooms_view";
      
      public static const const_340:String = "me_menu_my_clothes_view";
      
      public static const const_1113:String = "me_menu_dance_moves_view";
      
      public static const const_875:String = "me_menu_effects_view";
      
      public static const const_728:String = "me_menu_settings_view";
      
      public static const const_696:String = "me_menu_sound_settings";
      
      private static const const_1438:int = 5000;
      
      private static const const_1040:Point = new Point(95,185);
       
      
      private var var_45:IMeMenuView;
      
      private var _mainContainer:IWindowContainer;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1256:Point;
      
      private var var_1535:int = 0;
      
      private var var_2739:int = 0;
      
      private var var_2742:int = 0;
      
      private var var_2743:Boolean = false;
      
      private var var_1978:int = 0;
      
      private var var_1257:Boolean = false;
      
      private var var_2741:Boolean = false;
      
      private var var_379:Boolean = false;
      
      private var var_2693:int = 0;
      
      private var var_2740:Boolean = false;
      
      private var var_1979:int = 0;
      
      private var var_1721:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1023:Boolean;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this.var_1256 = new Point(0,0);
         this._eventDispatcher = param4;
         this.var_1023 = this._config.getKey("client.toolbar.static.enabled","com.sulake.habbo.inventory.marketplace") == "InfoStandSongDiskView";
         if(param5 != null && false)
         {
            this.var_2740 = param5.getKey("client.news.embed.enabled","com.sulake.habbo.inventory.marketplace") == "InfoStandSongDiskView";
         }
         this.changeView(const_106);
         this.hide();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hide();
         this._eventDispatcher = null;
         if(this.var_45 != null)
         {
            this.var_45.dispose();
            this.var_45 = null;
         }
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_832,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_909,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_672,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_816,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_959,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_692,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_110,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_275,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_889,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_130,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_380,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_126,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_508,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_73,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_97,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_428,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_832,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_909,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_672,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_816,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_110,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_275,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_889,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_959,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_692,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_130,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_380,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_508,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_126,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_73,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_97,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_97,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:* = null;
         if(!this.var_1023)
         {
            _loc2_ = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_868);
            _loc2_.window = this._mainContainer.parent as IWindowContainer;
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
         if(this.var_45 != null)
         {
            this._mainContainer.removeChild(this.var_45.window);
            this.var_45.dispose();
            this.var_45 = null;
         }
         if(this.var_1023)
         {
            this._mainContainer.visible = false;
         }
         this.var_379 = false;
         this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function show() : void
      {
         var _loc1_:* = null;
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_106);
         if(!this.var_1023)
         {
            _loc1_ = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_735);
            _loc1_.window = this._mainContainer.parent as IWindowContainer;
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc1_);
            }
            this.var_379 = true;
         }
         else
         {
            this._mainContainer.position = const_1040;
            this._mainContainer.visible = true;
            this.var_379 = true;
         }
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_379 && this.var_45.window.name == const_340))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_756);
            if(messageListener != null)
            {
               if(!this.var_1721)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_379)
         {
            return;
         }
         if(this.var_45.window.name == const_696)
         {
            (this.var_45 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_508:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_379 + " view: " + this.var_45.window.name);
               if(this.var_379 != true || this.var_45.window.name != const_106)
               {
                  return;
               }
               (this.var_45 as MeMenuMainView).setIconAssets("clothes_icon",const_106,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_126:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               this.var_379 = !this.var_379;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_379 = false;
               break;
            default:
               return;
         }
         if(this.var_379)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1257 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1257 = true;
            }
         }
         if(this.var_45 != null && this.var_45.window.name == const_875)
         {
            (this.var_45 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_45 != null && this.var_45.window.name != const_340)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_45 != null && this.var_45.window.name == const_340)
         {
            this.changeView(const_106);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_45 != null && this.var_45.window.name == const_340)
         {
            this.changeView(const_106);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1535;
         this.var_1535 = param1.daysLeft;
         this.var_2739 = param1.periodsLeft;
         this.var_2742 = param1.pastPeriods;
         this.var_2743 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_1978);
         this.var_1978 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_45 != null)
            {
               this.changeView(this.var_45.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1257 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1257 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_1979 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_1979.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1721 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1721 = true;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1304,HabboWindowStyle.const_1085,HabboWindowParam.const_45,new Rectangle(0,0,170,260)) as IWindowContainer;
            if(!this.var_1023)
            {
               this._mainContainer.tags.push("room_widget_me_menu");
            }
         }
         return this._mainContainer;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_106:
               _loc2_ = new MeMenuMainView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_875:
               _loc2_ = new MeMenuEffectsView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1113:
               _loc2_ = new MeMenuDanceView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_340:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1534:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_728:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_696:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_45 != null)
            {
               this._mainContainer.removeChild(this.var_45.window);
               this.var_45.dispose();
               this.var_45 = null;
            }
            this.var_45 = _loc2_;
            this.var_45.init(this,param1);
         }
         this.updateSize();
         if(this.var_1023 && param1 == const_106)
         {
            this.mainContainer.position = const_1040;
         }
      }
      
      public function updateSize() : void
      {
         if(this.var_45 != null)
         {
            this.var_1256.x = this.var_45.window.width + 10;
            this.var_1256.y = this.var_45.window.height;
            this.var_45.window.x = 5;
            this.var_45.window.y = 0;
            this._mainContainer.width = this.var_1256.x;
            this._mainContainer.height = this.var_1256.y;
         }
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2743;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1535 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1535;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2739;
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2742;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_1978;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2740;
      }
      
      public function get creditBalance() : int
      {
         return this.var_1979;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_2693 = getTimer();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = getTimer();
         return _loc1_ - this.var_2693 > const_1438;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1257;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2741;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2741 = param1;
      }
   }
}
