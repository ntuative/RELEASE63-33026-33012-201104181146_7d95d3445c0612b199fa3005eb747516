package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_983:String = "avatar";
      
      private static const const_637:Number = -0.01;
      
      private static const const_636:Number = -0.409;
      
      private static const const_981:int = 2;
      
      private static const const_1313:Array = [0,0,0];
      
      private static const const_1311:int = 3;
       
      
      private var var_587:AvatarVisualizationData = null;
      
      private var var_557:Map;
      
      private var var_484:Map;
      
      private var var_1286:int = 0;
      
      private var var_988:Boolean;
      
      private var var_683:String;
      
      private var var_1048:String;
      
      private var var_1287:int = 0;
      
      private var var_589:BitmapDataAsset;
      
      private var var_895:BitmapDataAsset;
      
      private var var_1654:int = -1;
      
      private var var_1652:int = -1;
      
      private var var_1658:int = -1;
      
      private const const_982:int = 0;
      
      private const const_1823:int = 1;
      
      private const const_1785:int = 2;
      
      private const const_1786:int = 3;
      
      private const const_1312:int = 4;
      
      private var var_1675:int = -1;
      
      private var var_243:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_1657:Boolean = false;
      
      private var var_1653:Boolean = false;
      
      private var var_1655:Boolean = false;
      
      private var var_1363:Boolean = false;
      
      private var var_627:Boolean = false;
      
      private var var_1362:int = 0;
      
      private var var_1361:int = 0;
      
      private var var_2167:int = 0;
      
      private var var_720:int = 0;
      
      private var var_721:int = 0;
      
      private var var_588:int = 0;
      
      private var var_1364:int = 0;
      
      private var var_1095:Boolean = false;
      
      private var var_1651:Boolean = false;
      
      private var var_1096:int = 0;
      
      private var var_722:int = 0;
      
      private var var_1656:Boolean = false;
      
      private var var_1094:int = 0;
      
      private var var_59:IAvatarImage = null;
      
      private var var_1076:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_557 = new Map();
         this.var_484 = new Map();
         this.var_988 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_557 != null)
         {
            this.resetImages();
            this.var_557.dispose();
            this.var_484.dispose();
            this.var_557 = null;
         }
         this.var_587 = null;
         this.var_589 = null;
         this.var_895 = null;
         super.dispose();
         this.var_1076 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1076;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_587 = param1 as AvatarVisualizationData;
         createSprites(this.const_1312);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_172)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_260) > 0 && param3);
            if(_loc5_ != this.var_1657)
            {
               this.var_1657 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_402) > 0;
            if(_loc5_ != this.var_1653)
            {
               this.var_1653 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_385) > 0;
            if(_loc5_ != this.var_1655)
            {
               this.var_1655 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_745) > 0 && param3);
            if(_loc5_ != this.var_1363)
            {
               this.var_1363 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1200) > 0;
            if(_loc5_ != this.var_627)
            {
               this.var_627 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_137);
            if(_loc6_ != this.var_1362)
            {
               this.var_1362 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_284);
            if(_loc7_ != this.var_243)
            {
               this.var_243 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_753);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1135);
            if(_loc6_ != this.var_1361)
            {
               this.var_1361 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_576);
            if(_loc6_ != this.var_720)
            {
               this.var_720 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_483);
            if(_loc6_ != this.var_721)
            {
               this.var_721 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_375);
            if(_loc6_ != this.var_588)
            {
               this.var_588 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_197);
            if(_loc6_ != this.var_1654)
            {
               this.var_1654 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_721 > 0 && param1.getNumber(RoomObjectVariableEnum.const_375) > 0)
            {
               if(this.var_588 != this.var_721)
               {
                  this.var_588 = this.var_721;
                  _loc4_ = true;
               }
            }
            else if(this.var_588 != 0)
            {
               this.var_588 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_681);
            if(_loc6_ != this.var_1096)
            {
               this.var_1096 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_1061);
            if(_loc7_ != this.var_1048)
            {
               this.var_1048 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_187);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_172 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_683 != param1)
         {
            this.var_683 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_557)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_484)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_557.reset();
         this.var_484.reset();
         this.var_59 = null;
         _loc2_ = getSprite(this.const_982);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1363 = false;
         }
         if(this.var_243 == "sit" || this.var_243 == "lay")
         {
            this.var_1364 = param1 / 2;
         }
         else
         {
            this.var_1364 = 0;
         }
         this.var_1651 = false;
         this.var_1095 = false;
         if(this.var_243 == "lay")
         {
            this.var_1095 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_1651 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_557.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_484.getValue(_loc4_) as IAvatarImage;
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_587.getAvatar(this.var_683,param1,this.var_1048,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_557.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_484.length >= const_1311)
                  {
                     this.var_484.remove(this.var_484.getKeys().shift());
                  }
                  this.var_484.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_473 != param1.getUpdateID() || this.var_1675 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1654;
            if(this.var_243 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1652 || param4)
            {
               _loc5_ = true;
               this.var_1652 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_59.setDirectionAngle(AvatarSetType.const_37,_loc6_);
            }
            if(_loc7_ != this.var_1658 || param4)
            {
               _loc5_ = true;
               this.var_1658 = _loc7_;
               if(this.var_1658 != this.var_1652)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_59.setDirectionAngle(AvatarSetType.const_51,_loc7_);
               }
            }
            var_473 = param1.getUpdateID();
            this.var_1675 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1823);
         this.var_589 = null;
         if(this.var_243 == "mv" || this.var_243 == "std")
         {
            _loc2_.visible = true;
            if(this.var_589 == null || param1 != var_88)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_589 = this.var_59.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_589 = this.var_59.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_589 != null)
               {
                  _loc2_.asset = this.var_589.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_589 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_895 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1785);
         if(this.var_627)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_895 = this.var_587.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_895 = this.var_587.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_243 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_243 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_895 != null)
            {
               _loc2_.asset = this.var_895.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1786);
         if(this.var_1096 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_587.getAvatarRendererAsset("number_" + this.var_1096 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_587.getAvatarRendererAsset("number_" + this.var_1096 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_243 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_243 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_722 = 1;
               this.var_1656 = true;
               this.var_1094 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_722 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1786);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1656)
         {
            ++this.var_1094;
            if(this.var_1094 < 10)
            {
               return false;
            }
            if(this.var_722 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1094 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_722 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_722 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_722 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_722 = 0;
               this.var_1656 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_587 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_720;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_88 || this.var_59 == null)
         {
            if(_loc7_ != var_88)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_720)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_59 == null || _loc12_)
            {
               this.var_59 = this.getAvatarImage(_loc7_,this.var_720);
               if(this.var_59 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_982);
               if(_loc16_ && this.var_59 && this.var_59.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_59 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_59);
            var_88 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_988 || this.var_1287 > 0) && param3;
         if(_loc14_)
         {
            this.var_1287 = const_981;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1287;
            --this.var_1286;
            if(!(this.var_1286 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_59.updateAnimationByFrames(1);
            this.var_1286 = const_981;
            _loc18_ = this.var_59.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1313;
            }
            _loc17_ = getSprite(this.const_982);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_59.getImage(AvatarSetType.const_37,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1364;
               }
               if(this.var_1095)
               {
                  if(this.var_1651)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_636 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_637 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_1785);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1095)
               {
                  _loc17_.relativeDepth = const_637 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_636 - 0.01 + _loc18_[2];
               }
            }
            this.var_988 = this.var_59.isAnimating();
            _loc19_ = this.const_1312;
            for each(_loc20_ in this.var_59.getSprites())
            {
               if(_loc20_.id == const_983)
               {
                  _loc17_ = getSprite(this.const_982);
                  _loc22_ = this.var_59.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_59.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_59.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_59.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_59.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_59.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_59.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_59.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_59.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_59.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1364;
                     if(this.var_1095)
                     {
                        _loc17_.relativeDepth = const_636 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_637 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_416,this.var_243,this._postureParameter);
         if(this.var_1362 > 0)
         {
            param1.appendAction(AvatarAction.const_338,AvatarAction.const_1682[this.var_1362]);
         }
         if(this.var_1361 > 0)
         {
            param1.appendAction(AvatarAction.DANCE,this.var_1361);
         }
         if(this.var_2167 > 0)
         {
            param1.appendAction(AvatarAction.const_844,this.var_2167);
         }
         if(this.var_721 > 0)
         {
            param1.appendAction(AvatarAction.const_885,this.var_721);
         }
         if(this.var_588 > 0)
         {
            param1.appendAction(AvatarAction.const_744,this.var_588);
         }
         if(this.var_1657)
         {
            param1.appendAction(AvatarAction.const_330);
         }
         if(this.var_1655 || this.var_1363)
         {
            param1.appendAction(AvatarAction.const_602);
         }
         if(this.var_1653)
         {
            param1.appendAction(AvatarAction.WAVE);
         }
         if(this.var_720 > 0)
         {
            param1.appendAction(AvatarAction.const_288,this.var_720);
         }
         param1.endActionAppends();
         this.var_988 = param1.isAnimating();
         var _loc2_:int = this.const_1312;
         for each(_loc3_ in this.var_59.getSprites())
         {
            if(_loc3_.id != const_983)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
