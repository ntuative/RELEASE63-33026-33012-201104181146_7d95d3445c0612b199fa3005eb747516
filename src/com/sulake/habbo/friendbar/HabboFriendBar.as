package com.sulake.habbo.friendbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.ComponentContext;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendbar.data.HabboFriendBarData;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarView;
   import com.sulake.habbo.friendbar.view.HabboFriendBarView;
   import com.sulake.iid.IIDHabboConfigurationManager;
   
   public class HabboFriendBar extends ComponentContext
   {
       
      
      private var var_188:IHabboConfigurationManager;
      
      private var var_1352:Boolean = false;
      
      public function HabboFriendBar(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationAvailable);
      }
      
      public function get findFriendsEnabled() : Boolean
      {
         return this.var_1352;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_188)
            {
               this.var_188.release(new IIDHabboConfigurationManager());
               this.var_188 = null;
            }
         }
      }
      
      private function onConfigurationAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_188 = param2 as IHabboConfigurationManager;
         var _loc3_:* = this.var_188.getKey("friendbar.enabled") == "InfoStandSongDiskView";
         this.var_1352 = this.var_188.getKey("friend_bar.helper.friend_finding.enabled") == "InfoStandSongDiskView";
         var _loc4_:* = this.var_188.getKey("client.toolbar.static.enabled","com.sulake.habbo.inventory.marketplace") == "InfoStandSongDiskView";
         if(_loc3_)
         {
            attachComponent(new HabboFriendBarData(this,0,assets),[new IIDHabboFriendBarData()]);
            attachComponent(new HabboFriendBarView(this,!!_loc4_ ? 1 : uint(0),assets),[new IIDHabboFriendBarView()]);
         }
      }
   }
}
