package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_752:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1076)
         {
            _structure = null;
            _assets = null;
            var_261 = null;
            var_284 = null;
            var_683 = null;
            var_569 = null;
            var_330 = null;
            if(!var_1332 && var_48)
            {
               var_48.dispose();
            }
            var_48 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_824 = null;
            var_1076 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_752[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_752[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_416:
               switch(_loc3_)
               {
                  case AvatarAction.const_792:
                  case AvatarAction.const_622:
                  case AvatarAction.const_436:
                  case AvatarAction.const_914:
                  case AvatarAction.const_396:
                  case AvatarAction.const_938:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_288:
            case AvatarAction.DANCE:
            case AvatarAction.WAVE:
            case AvatarAction.const_844:
            case AvatarAction.const_885:
            case AvatarAction.const_744:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
