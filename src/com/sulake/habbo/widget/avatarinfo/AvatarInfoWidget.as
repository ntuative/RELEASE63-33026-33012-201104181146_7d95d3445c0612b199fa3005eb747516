package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_22:Component;
      
      private var var_188:IHabboConfigurationManager;
      
      private var _view:AvatarInfoView;
      
      private var var_194:Boolean = false;
      
      private var var_1721:Boolean = false;
      
      private var var_1135:Timer;
      
      private var var_2919:int = 3000;
      
      private var var_1402:Boolean;
      
      private var var_924:Boolean;
      
      private var var_805:Number;
      
      private var var_1403:int;
      
      private var var_2920:int = 500;
      
      private var var_298:AvatarInfoData;
      
      public function AvatarInfoWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboConfigurationManager, param4:IHabboLocalizationManager, param5:Component)
      {
         super(param1,param2,param4);
         this.var_22 = param5;
         this.var_188 = param3;
         this.var_1402 = false;
         this.var_924 = false;
         this.var_1135 = new Timer(this.var_2919,1);
         this.var_1135.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
         this.var_298 = new AvatarInfoData();
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_188;
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_924 = true;
         this.var_1403 = 0;
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_778,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_22)
         {
            this.var_22.removeUpdateReceiver(this);
            this.var_22 = null;
         }
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
         }
         this.var_188 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_128,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_130,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_108,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_110,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_344,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_111,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_122,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_170,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_97,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_428,this.updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_128,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_130,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_108,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_110,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_344,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_111,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_122,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_170,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_97,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_428,this.updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_128:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_208,_loc2_.allowNameChange,null);
               this.var_194 = true;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_110:
            case RoomWidgetFurniInfoUpdateEvent.const_344:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_130:
               this.getOwnCharacterInfo();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_108:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.var_298.amIAnyRoomController = _loc3_.amIAnyRoomController;
               this.var_298.amIController = _loc3_.amIController;
               this.var_298.amIOwner = _loc3_.amIOwner;
               this.var_298.canBeAskedAsFriend = _loc3_.canBeAskedAsFriend;
               this.var_298.canBeKicked = _loc3_.canBeKicked;
               this.var_298.canTrade = _loc3_.canTrade;
               this.var_298.canTradeReason = _loc3_.canTradeReason;
               this.var_298.hasFlatControl = _loc3_.hasFlatControl;
               this.var_298.isIgnored = _loc3_.isIgnored;
               this.var_298.respectLeft = _loc3_.respectLeft;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_208,false,!!_loc3_.isSpectatorMode ? null : this.var_298);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_673,false,null);
               break;
            case RoomWidgetPetInfoUpdateEvent.const_111:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_191,false,null);
               break;
            case RoomWidgetUserDataUpdateEvent.const_122:
               if(!this.var_194)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_170:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this._view && this._view.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_97:
               this.var_1721 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_428:
               this.var_1721 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:AvatarInfoData) : void
      {
         this.var_924 = false;
         if(this.var_1135.running)
         {
            this.var_1135.stop();
         }
         if(this._view == null || this._view.userId != param1 || this._view.userName != param2 || this._view.roomIndex != param3 || this._view.userType != param4)
         {
            if(this._view)
            {
               this.disposeView();
            }
            if(!this.var_1721)
            {
               if(param6 && false)
               {
                  this._view = new AvatarMenuView(this,param1,param2,param3,param4,param6);
               }
               else
               {
                  this._view = new AvatarInfoView(this,param1,param2,param3,param4,param5);
               }
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this._view)
         {
            this._view.dispose();
            this._view = null;
            this.var_1402 = true;
            this.var_924 = false;
         }
      }
      
      private function removeView() : void
      {
         if(!this.var_1402)
         {
            this.var_1402 = true;
            this.var_1135.start();
         }
         else if(!this.var_924)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_22)
         {
            return;
         }
         if(this._view)
         {
            this.var_22.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_22.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this._view)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this._view.userId,this._view.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_924)
         {
            this.var_1403 += param1;
            this.var_805 = 1 - this.var_1403 / Number(this.var_2920);
         }
         else
         {
            this.var_805 = 1;
         }
         if(this.var_805 <= 0)
         {
            this.disposeView();
            return;
         }
         this._view.update(_loc2_.rectangle,this.var_805);
      }
   }
}
