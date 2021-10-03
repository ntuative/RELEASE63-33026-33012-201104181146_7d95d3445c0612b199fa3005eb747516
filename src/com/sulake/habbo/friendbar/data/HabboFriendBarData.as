package com.sulake.habbo.friendbar.data
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.friendlist.BuddyRequestsEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FindFriendsProcessResultEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendListUpdateEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.MessengerInitEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.NewBuddyRequestEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.NewConsoleMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.friendlist.RoomInviteEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.FindNewFriendsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.FollowFriendMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.ConversionPointMessageComposer;
   import com.sulake.habbo.communication.messages.parser.friendlist.FriendListUpdateMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.NewConsoleMessageMessageParser;
   import com.sulake.habbo.communication.messages.parser.friendlist.RoomInviteMessageParser;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.messenger.IHabboMessenger;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboMessenger;
   
   public class HabboFriendBarData extends Component implements IHabboFriendBarData
   {
      
      private static const const_287:Boolean = false;
      
      private static const const_656:String = "FriendBar";
      
      private static const const_657:String = "user_interaction";
      
      private static const TRACKING_EVENT_ACTION_VISIT:String = "visit_btn_click";
      
      private static const const_1436:String = "chat_btn_click";
      
      private static const const_1437:String = "find_friends_btn_click";
       
      
      private var var_124:IHabboCommunicationManager;
      
      private var var_455:IHabboFriendList;
      
      private var var_549:IHabboMessenger;
      
      private var var_142:Array;
      
      private var var_318:Map;
      
      private var var_370:Array;
      
      private var var_1976:int;
      
      public function HabboFriendBarData(param1:HabboFriendBar, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_142 = new Array();
         this.var_318 = new Map();
         this.var_370 = new Array();
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerAvailable);
         queueInterface(new IIDHabboFriendList(),this.onFriendListComponentAvailable);
         queueInterface(new IIDHabboMessenger(),this.onMessengerComponentAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_124)
            {
               this.var_124.release(new IIDHabboCommunicationManager());
               this.var_124 = null;
            }
            if(this.var_455)
            {
               this.var_455.release(new IIDHabboFriendList());
               this.var_455 = null;
            }
            if(this.var_549)
            {
               this.var_549.release(new IIDHabboMessenger());
               this.var_549 = null;
            }
            this.var_142 = null;
            this.var_318.dispose();
            this.var_318 = null;
            this.var_370 = null;
            super.dispose();
         }
      }
      
      public function get numFriends() : int
      {
         return this.var_142.length;
      }
      
      public function getFriendAt(param1:int) : IFriendEntity
      {
         return this.var_142[param1];
      }
      
      public function getFriendByID(param1:int) : IFriendEntity
      {
         return this.var_318.getValue(param1);
      }
      
      public function getFriendByName(param1:String) : IFriendEntity
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_142)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get numFriendRequests() : int
      {
         return this.var_370.length;
      }
      
      public function getFriendRequestAt(param1:int) : FriendRequest
      {
         return this.var_370[param1];
      }
      
      public function getFriendRequestByID(param1:int) : FriendRequest
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_370)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getFriendRequestByName(param1:String) : FriendRequest
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_370)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function followToRoom(param1:int) : void
      {
         if(this.var_124)
         {
            this.var_124.getHabboMainConnection(null).send(new FollowFriendMessageComposer(param1));
            this.var_124.getHabboMainConnection(null).send(new ConversionPointMessageComposer(const_656,const_657,TRACKING_EVENT_ACTION_VISIT));
         }
      }
      
      public function startConversation(param1:int) : void
      {
         if(this.var_549)
         {
            this.var_549.startConversation(param1);
            if(this.var_124)
            {
               this.var_124.getHabboMainConnection(null).send(new ConversionPointMessageComposer(const_656,const_657,const_1436));
            }
         }
      }
      
      public function findNewFriends() : void
      {
         if(this.var_124)
         {
            this.var_124.getHabboMainConnection(null).send(new FindNewFriendsMessageComposer());
            this.var_124.getHabboMainConnection(null).send(new ConversionPointMessageComposer(const_656,const_657,const_1437));
         }
      }
      
      public function toggleFriendList() : void
      {
         if(this.var_455)
         {
            if(!this.var_455.disposed)
            {
               if(!this.var_455.isOpen())
               {
                  if(this.var_370.length > 0)
                  {
                     this.var_455.openFriendRequests();
                  }
                  else
                  {
                     this.var_455.openFriendList();
                  }
               }
               else
               {
                  this.var_455.close();
               }
            }
         }
      }
      
      public function openMessenger() : void
      {
         if(this.var_549)
         {
            if(!this.var_549.disposed)
            {
               this.var_549.startConversation(this.var_1976);
            }
         }
      }
      
      private function onCommunicationManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_124 = param2 as IHabboCommunicationManager;
         this.var_124.addHabboConnectionMessageEvent(new MessengerInitEvent(this.onMessengerInitialized));
         this.var_124.addHabboConnectionMessageEvent(new FriendListUpdateEvent(this.onFriendListUpdate));
         this.var_124.addHabboConnectionMessageEvent(new FindFriendsProcessResultEvent(this.onFindFriendProcessResult));
         this.var_124.addHabboConnectionMessageEvent(new NewBuddyRequestEvent(this.onNewFriendRequest));
         this.var_124.addHabboConnectionMessageEvent(new BuddyRequestsEvent(this.onFriendRequestList));
         this.var_124.addHabboConnectionMessageEvent(new NewConsoleMessageEvent(this.onNewConsoleMessage));
         this.var_124.addHabboConnectionMessageEvent(new RoomInviteEvent(this.onRoomInvite));
      }
      
      private function onMessengerComponentAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_549 = param2 as IHabboMessenger;
      }
      
      private function onFriendListComponentAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_455 = param2 as IHabboFriendList;
      }
      
      private function onMessengerInitialized(param1:IMessageEvent) : void
      {
         this.buildFriendList(MessengerInitEvent(param1).getParser().friends);
      }
      
      private function onFriendListUpdate(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc8_:int = 0;
         var _loc2_:FriendListUpdateMessageParser = FriendListUpdateEvent(param1).getParser();
         var _loc5_:Array = _loc2_.removedFriendIds;
         var _loc6_:Array = _loc2_.updatedFriends;
         var _loc7_:Array = _loc2_.addedFriends;
         for each(_loc8_ in _loc5_)
         {
            _loc3_ = this.var_318.getValue(_loc8_);
            if(_loc3_)
            {
               this.var_318.remove(_loc8_);
               this.var_142.splice(this.var_142.indexOf(_loc3_),1);
            }
         }
         for each(_loc4_ in _loc6_)
         {
            _loc3_ = this.var_318.getValue(_loc4_.id);
            if(_loc3_)
            {
               if(_loc4_.online || const_287)
               {
                  _loc3_.name = _loc4_.name;
                  _loc3_.realName = _loc4_.realName;
                  _loc3_.motto = _loc4_.motto;
                  _loc3_.gender = _loc4_.gender;
                  _loc3_.online = _loc4_.online;
                  _loc3_.allowFollow = _loc4_.followingAllowed;
                  _loc3_.figure = _loc4_.figure;
                  _loc3_.categoryId = _loc4_.categoryId;
                  _loc3_.lastAccess = _loc4_.lastAccess;
               }
               else
               {
                  this.var_318.remove(_loc4_.id);
                  this.var_142.splice(this.var_142.indexOf(_loc3_),1);
               }
            }
            else if(_loc4_.online || const_287)
            {
               _loc3_ = new FriendEntity(_loc4_.id,_loc4_.name,_loc4_.realName,_loc4_.motto,_loc4_.gender,_loc4_.online,_loc4_.followingAllowed,_loc4_.figure,_loc4_.categoryId,_loc4_.lastAccess);
               this.var_142.push(_loc3_);
               this.var_318.add(_loc3_.id,_loc3_);
            }
         }
         for each(_loc4_ in _loc7_)
         {
            if(_loc4_.online || const_287)
            {
               if(this.var_318.getValue(_loc4_.id) == null)
               {
                  _loc3_ = new FriendEntity(_loc4_.id,_loc4_.name,_loc4_.realName,_loc4_.motto,_loc4_.gender,_loc4_.online,_loc4_.followingAllowed,_loc4_.figure,_loc4_.categoryId,_loc4_.lastAccess);
                  this.var_142.push(_loc3_);
                  this.var_318.add(_loc3_.id,_loc3_);
               }
            }
         }
         if(_loc7_.length > 0 || _loc6_.length > 0)
         {
            this.var_142 = !!const_287 ? this.sortByNameAndOnlineStatus(this.var_142) : this.sortByName(this.var_142);
         }
         events.dispatchEvent(new FriendBarUpdateEvent());
      }
      
      private function onFindFriendProcessResult(param1:FindFriendsProcessResultEvent) : void
      {
         events.dispatchEvent(new FindFriendsNotificationEvent(param1.success));
      }
      
      private function onNewFriendRequest(param1:NewBuddyRequestEvent) : void
      {
         var _loc2_:FriendRequestData = param1.getParser().req;
         this.var_370.push(new FriendRequest(_loc2_.requestId,_loc2_.requesterName));
         events.dispatchEvent(new FriendRequestEvent());
      }
      
      private function onFriendRequestList(param1:BuddyRequestsEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:Array = param1.getParser().reqs;
         for each(_loc3_ in _loc2_)
         {
            this.var_370.push(new FriendRequest(_loc3_.requestId,_loc3_.requesterName));
         }
         events.dispatchEvent(new FriendRequestEvent());
      }
      
      private function onNewConsoleMessage(param1:NewConsoleMessageEvent) : void
      {
         var _loc2_:NewConsoleMessageMessageParser = param1.getParser();
         this.var_1976 = _loc2_.senderId;
         events.dispatchEvent(new NewMessageEvent());
      }
      
      private function onRoomInvite(param1:RoomInviteEvent) : void
      {
         var _loc2_:RoomInviteMessageParser = param1.getParser();
         this.var_1976 = _loc2_.senderId;
         events.dispatchEvent(new NewMessageEvent());
      }
      
      private function buildFriendList(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_.online || const_287)
            {
               _loc3_ = new FriendEntity(_loc2_.id,_loc2_.name,_loc2_.realName,_loc2_.motto,_loc2_.gender,_loc2_.online,_loc2_.followingAllowed,_loc2_.figure,_loc2_.categoryId,_loc2_.lastAccess);
               this.var_142.push(_loc3_);
               this.var_318.add(_loc3_.id,_loc3_);
            }
         }
         this.var_142 = !!const_287 ? this.sortByNameAndOnlineStatus(this.var_142) : this.sortByName(this.var_142);
         events.dispatchEvent(new FriendBarUpdateEvent());
      }
      
      private function sortByName(param1:Array) : Array
      {
         param1.sortOn("name",[Array.CASEINSENSITIVE]);
         return param1;
      }
      
      private function sortByNameAndOnlineStatus(param1:Array) : Array
      {
         var _loc4_:* = null;
         var _loc2_:* = [];
         var _loc3_:* = [];
         var _loc5_:int = param1.length;
         while(_loc5_-- > 0)
         {
            _loc4_ = param1[_loc5_];
            if(_loc4_.online)
            {
               _loc2_.push(_loc4_);
            }
            else
            {
               _loc3_.push(_loc4_);
            }
         }
         _loc2_.sortOn("name",[Array.CASEINSENSITIVE]);
         _loc3_.sortOn("name",[0 | 0]);
         _loc5_ = _loc3_.length;
         while(_loc5_-- > 0)
         {
            _loc2_.push(_loc3_.pop());
         }
         return _loc2_;
      }
   }
}
