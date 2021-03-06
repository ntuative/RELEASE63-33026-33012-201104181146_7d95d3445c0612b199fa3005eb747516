package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.actions.ActionDefinition;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class AvatarImage implements IAvatarImage, IDisposable
   {
      
      private static const CHANNELS_EQUAL:String = "CHANNELS_EQUAL";
      
      private static const CHANNELS_UNIQUE:String = "CHANNELS_UNIQUE";
      
      private static const CHANNELS_RED:String = "CHANNELS_RED";
      
      private static const CHANNELS_GREEN:String = "CHANNELS_GREEN";
      
      private static const CHANNELS_BLUE:String = "CHANNELS_BLUE";
      
      private static const CHANNELS_SATURATED:String = "CHANNELS_SATURATED";
      
      private static const const_1348:String = "Default";
      
      private static const const_1346:int = 2;
      
      private static const const_1347:String = AvatarSetType.const_37;
       
      
      protected var _structure:AvatarStructure;
      
      protected var _scale:String;
      
      protected var var_89:int;
      
      protected var var_2047:int;
      
      protected var var_284:IActiveActionData;
      
      protected var var_1076:Boolean;
      
      protected var var_824:Array;
      
      protected var _assets:AssetAliasCollection;
      
      protected var var_261:AvatarImageCache;
      
      protected var var_683:AvatarFigureContainer;
      
      protected var var_569:IAvatarDataContainer;
      
      protected var var_330:Array;
      
      protected var var_48:BitmapData;
      
      private var var_993:IActiveActionData;
      
      private var var_608:int = 0;
      
      private var var_1717:int = 0;
      
      private var var_607:Boolean;
      
      private var var_202:Array;
      
      private var var_988:Boolean;
      
      private var var_1397:Boolean = false;
      
      private var var_248:Array;
      
      private var var_1398:String;
      
      private var var_504:String;
      
      private var var_752:Map;
      
      protected var var_1332:Boolean = false;
      
      private var var_1132:Boolean;
      
      private var var_1399:int = -1;
      
      private var var_2962:int;
      
      private var var_2963:int;
      
      private var var_1718:Array;
      
      private var var_2335:int = -1;
      
      private var var_2336:String = null;
      
      private var var_2334:String = null;
      
      public function AvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         this.var_824 = new Array();
         this.var_330 = [];
         this.var_1718 = [];
         super();
         this.var_607 = true;
         this._structure = param1;
         this._assets = param2;
         this._scale = param4;
         if(this._scale == null)
         {
            this._scale = AvatarScaleType.const_53;
         }
         if(param3 == null)
         {
            param3 = new AvatarFigureContainer("hr-893-45.hd-180-2.ch-210-66.lg-270-82.sh-300-91.wa-2007-.ri-1-");
            Logger.log("Using default avatar figure");
         }
         this.var_683 = param3;
         this.var_261 = new AvatarImageCache(this._structure,this,this._assets,this._scale);
         this.setDirection(const_1347,const_1346);
         this.var_330 = new Array();
         this.var_993 = new ActiveActionData(AvatarAction.const_436);
         this.var_993.definition = this._structure.getActionDefinition(const_1348);
         this.resetActions();
         this.var_752 = new Map();
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!this.var_1076)
         {
            this._structure = null;
            this._assets = null;
            this.var_261 = null;
            this.var_284 = null;
            this.var_683 = null;
            this.var_569 = null;
            this.var_330 = null;
            if(this.var_48)
            {
               this.var_48.dispose();
            }
            _loc1_ = this.getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            if(this.var_752)
            {
               for each(_loc2_ in this.var_752)
               {
                  _loc2_.dispose();
               }
               this.var_752.dispose();
               this.var_752 = null;
            }
            this.var_48 = null;
            this.var_824 = null;
            this.var_1076 = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1076;
      }
      
      public function getFigure() : IAvatarFigureContainer
      {
         return this.var_683;
      }
      
      public function getScale() : String
      {
         return this._scale;
      }
      
      public function getPartColor(param1:String) : IPartColor
      {
         return this._structure.getPartColor(this.var_683,param1);
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         param2 += this.var_1717;
         if(param2 < AvatarDirectionAngle.const_1190)
         {
            param2 = AvatarDirectionAngle.const_332 + (param2 + 1);
         }
         if(param2 > AvatarDirectionAngle.const_332)
         {
            param2 -= NaN;
         }
         if(this._structure.isMainAvatarSet(param1))
         {
            this.var_89 = param2;
         }
         if(param1 == AvatarSetType.const_51 || param1 == AvatarSetType.const_37)
         {
            if(param1 == AvatarSetType.const_51 && this.isHeadTurnPreventedByAction())
            {
               param2 = this.var_89;
            }
            this.var_2047 = param2;
         }
         this.getCache().setDirection(param1,param2);
         this.var_607 = true;
      }
      
      public function setDirectionAngle(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = param2 / 45;
         this.setDirection(param1,_loc3_);
      }
      
      public function getSprites() : Array
      {
         return this.var_202;
      }
      
      public function getCanvasOffsets() : Array
      {
         return this.var_824;
      }
      
      public function getLayerData(param1:ISpriteDataContainer) : IAnimationLayerData
      {
         return this._structure.getBodyPartData(param1.animation.id,this.var_608,param1.id);
      }
      
      public function updateAnimationByFrames(param1:int = 1) : void
      {
         this.var_608 += param1;
         this.var_607 = true;
      }
      
      private function getFullImageCacheKey() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(!this.var_1132)
         {
            return null;
         }
         if(this.var_248.length == 1 && this.var_89 == this.var_2047)
         {
            return this.var_89 + this.var_504 + this.var_608 % 4;
         }
         if(this.var_248.length == 2)
         {
            for each(_loc1_ in this.var_248)
            {
               if(_loc1_.actionType == "fx" && (_loc1_.actionParameter == "33" || _loc1_.actionParameter == "34" || _loc1_.actionParameter == "35" || _loc1_.actionParameter == "36"))
               {
                  return this.var_89 + this.var_504 + 0;
               }
               if(_loc1_.actionType == "fx" && (_loc1_.actionParameter == "38" || _loc1_.actionParameter == "39"))
               {
                  _loc2_ = this.var_608 % 11;
                  return this.var_89 + "_" + this.var_2047 + this.var_504 + _loc2_;
               }
            }
         }
         return null;
      }
      
      private function getBodyParts(param1:String, param2:String, param3:int) : Array
      {
         if(param3 != this.var_2335 || param2 != this.var_2336 || param1 != this.var_2334)
         {
            this.var_2335 = param3;
            this.var_2336 = param2;
            this.var_2334 = param1;
            this.var_1718 = this._structure.getBodyParts(param1,param2,param3);
         }
         return this.var_1718;
      }
      
      public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc13_:* = null;
         if(!this.var_607)
         {
            return this.var_48;
         }
         if(this.var_284 == null)
         {
            return null;
         }
         if(!this.var_1397)
         {
            this.endActionAppends();
         }
         var _loc3_:String = this.getFullImageCacheKey();
         if(_loc3_ != null)
         {
            if(this.getFullImage(_loc3_))
            {
               this.var_607 = false;
               if(param2)
               {
                  return (this.getFullImage(_loc3_) as BitmapData).clone();
               }
               this.var_48 = this.getFullImage(_loc3_) as BitmapData;
               this.var_1332 = true;
               return this.var_48;
            }
         }
         var _loc4_:AvatarImageCache = this.getCache();
         var _loc5_:AvatarCanvas = this._structure.getCanvas(this._scale,this.var_284.definition.geometryType);
         if(_loc5_ == null)
         {
            return null;
         }
         if(this.var_1332 || this.var_48 == null || (this.var_48.width != _loc5_.width || this.var_48.height != _loc5_.height))
         {
            if(this.var_48 != null && !this.var_1332)
            {
               this.var_48.dispose();
            }
            this.var_48 = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
            this.var_1332 = false;
         }
         var _loc6_:Array = this.getBodyParts(param1,this.var_284.definition.geometryType,this.var_89);
         this.var_48.lock();
         this.var_48.fillRect(this.var_48.rect,16777215);
         var _loc7_:Point = _loc5_.offset;
         if(_loc7_ == null)
         {
            _loc7_ = new Point(0,0);
         }
         var _loc12_:int = _loc6_.length - 1;
         while(_loc12_ >= 0)
         {
            _loc8_ = _loc6_[_loc12_];
            _loc9_ = _loc4_.getImageContainer(_loc8_,this.var_608);
            if(_loc9_ && _loc9_.image && _loc9_.regPoint)
            {
               _loc10_ = _loc9_.image;
               _loc11_ = _loc9_.regPoint.clone();
               this.var_48.copyPixels(_loc10_,_loc10_.rect,_loc11_.add(_loc7_),null,null,true);
            }
            _loc12_--;
         }
         this.var_48.unlock();
         this.var_607 = false;
         if(this.var_569 != null)
         {
            if(this.var_569.paletteIsGrayscale)
            {
               _loc13_ = this.convertToGrayscale(this.var_48);
               if(this.var_48)
               {
                  this.var_48.dispose();
               }
               this.var_48 = _loc13_;
               this.var_48.paletteMap(this.var_48,this.var_48.rect,new Point(0,0),this.var_569.reds,[],[]);
            }
            else
            {
               this.var_48.copyChannel(this.var_48,this.var_48.rect,new Point(0,0),2,8);
            }
         }
         if(_loc3_ != null)
         {
            this.cacheFullImage(_loc3_,this.var_48.clone());
         }
         if(this.var_48 && param2)
         {
            return this.var_48.clone();
         }
         return this.var_48;
      }
      
      public function getCroppedImage(param1:String) : BitmapData
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         if(this.var_284 == null)
         {
            return null;
         }
         var _loc2_:AvatarImageCache = this.getCache();
         var _loc3_:AvatarCanvas = this._structure.getCanvas(this._scale,this.var_284.definition.geometryType);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         var _loc5_:Array = this._structure.getBodyParts(param1,this.var_284.definition.geometryType,this.var_89);
         var _loc11_:Rectangle = new Rectangle();
         var _loc12_:int = _loc5_.length - 1;
         while(_loc12_ >= 0)
         {
            _loc7_ = _loc5_[_loc12_];
            _loc8_ = _loc2_.getImageContainer(_loc7_,this.var_608);
            if(_loc8_ != null)
            {
               _loc9_ = _loc8_.image;
               if(_loc9_ == null)
               {
                  _loc4_.dispose();
                  return null;
               }
               _loc10_ = _loc8_.regPoint.clone();
               _loc4_.copyPixels(_loc9_,_loc9_.rect,_loc10_,null,null,true);
               _loc11_.x = _loc10_.x;
               _loc11_.y = _loc10_.y;
               _loc11_.width = _loc9_.width;
               _loc11_.height = _loc9_.height;
               if(_loc6_ == null)
               {
                  _loc6_ = _loc11_;
               }
               else
               {
                  _loc6_ = _loc6_.union(_loc11_);
               }
            }
            _loc12_--;
         }
         if(_loc6_ == null)
         {
            _loc6_ = new Rectangle(0,0,1,1);
         }
         var _loc13_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         _loc13_.copyPixels(_loc4_,_loc6_,new Point(0,0),null,null,true);
         _loc4_.dispose();
         return _loc13_;
      }
      
      protected function getFullImage(param1:String) : BitmapData
      {
         return this.var_752[param1];
      }
      
      protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         this.var_752[param1] = param2;
      }
      
      public function getAsset(param1:String) : BitmapDataAsset
      {
         return this._assets.getAssetByName(param1) as BitmapDataAsset;
      }
      
      public function getDirection() : int
      {
         return this.var_89;
      }
      
      public function initActionAppends() : void
      {
         this.var_330 = new Array();
         this.var_1397 = false;
         this.var_504 = "";
         this.var_1132 = false;
      }
      
      public function endActionAppends() : void
      {
         if(this.sortActions())
         {
            this.resetActions();
            this.setActionsToParts();
         }
      }
      
      public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.var_1397 = false;
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
                     if(this.var_89 == 0)
                     {
                        this.setDirection(AvatarSetType.const_37,4);
                     }
                     else
                     {
                        this.setDirection(AvatarSetType.const_37,2);
                     }
                  case AvatarAction.const_622:
                     this.var_1132 = true;
                  case AvatarAction.const_436:
                     this.var_1132 = true;
                  case AvatarAction.const_914:
                  case AvatarAction.const_396:
                  case AvatarAction.const_938:
                  case AvatarAction.const_704:
                     this.addActionData(_loc3_);
                     break;
                  default:
                     this.errorThis("appendAction() >> UNKNOWN POSTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_338:
               switch(_loc3_)
               {
                  case AvatarAction.const_928:
                  case AvatarAction.const_833:
                  case AvatarAction.const_609:
                  case AvatarAction.const_962:
                     this.addActionData(_loc3_);
                     break;
                  default:
                     this.errorThis("appendAction() >> UNKNOWN GESTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_288:
               if(_loc3_ == "33" || _loc3_ == "34" || _loc3_ == "35" || _loc3_ == "36" || _loc3_ == "38" || _loc3_ == "39")
               {
                  this.var_1132 = true;
               }
            case AvatarAction.DANCE:
            case AvatarAction.const_330:
            case AvatarAction.WAVE:
            case AvatarAction.const_602:
            case AvatarAction.const_844:
               this.addActionData(param1,_loc3_);
               break;
            case AvatarAction.const_885:
            case AvatarAction.const_744:
               _loc4_ = this._structure.getActionDefinitionWithState(param1);
               if(_loc4_ != null)
               {
                  this.logThis("appendAction:" + [_loc3_,"->",_loc4_.getParameterValue(_loc3_)]);
                  _loc3_ = _loc4_.getParameterValue(_loc3_);
               }
               this.addActionData(param1,_loc3_);
               break;
            default:
               this.errorThis("appendAction() >> UNKNOWN ACTION TYPE: " + param1);
         }
         return true;
      }
      
      protected function addActionData(param1:String, param2:String = "") : void
      {
         var _loc3_:* = null;
         if(this.var_330 == null)
         {
            this.var_330 = new Array();
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_330.length)
         {
            _loc3_ = this.var_330[_loc4_];
            if(_loc3_.actionType == param1 && _loc3_.actionParameter == param2)
            {
               return;
            }
            _loc4_++;
         }
         this.var_330.push(new ActiveActionData(param1,param2,this.var_608));
      }
      
      public function isAnimating() : Boolean
      {
         return this.var_988;
      }
      
      private function resetActions() : Boolean
      {
         this.var_988 = false;
         this.var_202 = [];
         this.var_569 = null;
         this.var_1717 = 0;
         this._structure.removeDynamicItems();
         this.var_284 = this.var_993;
         this.var_284.definition = this.var_993.definition;
         this.resetBodyPartCache(this.var_993);
         return true;
      }
      
      private function isHeadTurnPreventedByAction() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:Boolean = false;
         if(this.var_248 == null)
         {
            return false;
         }
         for each(_loc3_ in this.var_248)
         {
            _loc2_ = this._structure.getActionDefinitionWithState(_loc3_.actionType);
            if(_loc2_ != null && _loc2_.getPreventHeadTurn(_loc3_.actionParameter))
            {
               _loc1_ = true;
            }
         }
         return _loc1_;
      }
      
      private function sortActions() : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc1_:Boolean = false;
         this.var_504 = "";
         this.var_248 = this._structure.sortActions(this.var_330);
         if(this.var_248 == null)
         {
            this.var_824 = new Array(0,0,0);
            if(this.var_1398 != "")
            {
               _loc1_ = true;
               this.var_1398 = "";
            }
         }
         else
         {
            this.var_824 = this._structure.getCanvasOffsets(this.var_248,this._scale,this.var_89);
            for each(_loc4_ in this.var_248)
            {
               this.var_504 += _loc4_.actionType + _loc4_.actionParameter;
               if(_loc4_.actionType == AvatarAction.const_288)
               {
                  _loc5_ = parseInt(_loc4_.actionParameter);
                  if(this.var_1399 != _loc5_)
                  {
                     _loc2_ = true;
                  }
                  this.var_1399 = _loc5_;
                  _loc3_ = true;
               }
            }
            if(!_loc3_)
            {
               if(this.var_1399 > -1)
               {
                  _loc2_ = true;
               }
               this.var_1399 = -1;
            }
            if(_loc2_)
            {
               _loc6_ = this.getCache();
               if(_loc6_)
               {
                  _loc6_.disposeInactiveActions(0);
               }
            }
            if(this.var_1398 != this.var_504)
            {
               _loc1_ = true;
               this.var_1398 = this.var_504;
            }
         }
         this.var_1397 = true;
         return _loc1_;
      }
      
      private function setActionsToParts() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_248 == null)
         {
            return;
         }
         var _loc3_:int = getTimer();
         var _loc4_:Array = new Array();
         for each(_loc1_ in this.var_248)
         {
            _loc4_.push(_loc1_.actionType);
         }
         for each(_loc1_ in this.var_248)
         {
            if(_loc1_ && _loc1_.definition && _loc1_.definition.isAnimation)
            {
               _loc2_ = this._structure.getAnimation(_loc1_.definition.state + "." + _loc1_.actionParameter);
               if(_loc2_ && _loc2_.hasOverriddenActions())
               {
                  _loc5_ = _loc2_.overriddenActionNames();
                  if(_loc5_)
                  {
                     for each(_loc6_ in _loc5_)
                     {
                        if(_loc4_.indexOf(_loc6_) >= 0)
                        {
                           _loc1_.overridingAction = _loc2_.overridingAction(_loc6_);
                        }
                     }
                  }
               }
            }
         }
         for each(_loc1_ in this.var_248)
         {
            if(!(!_loc1_ || !_loc1_.definition))
            {
               if(_loc1_.definition.isAnimation && _loc1_.actionParameter == "")
               {
                  _loc1_.actionParameter = "1";
               }
               this.setActionToParts(_loc1_,_loc3_);
               if(_loc1_.definition.isAnimation)
               {
                  this.var_988 = _loc1_.definition.isAnimated(_loc1_.actionParameter);
                  _loc2_ = this._structure.getAnimation(_loc1_.definition.state + "." + _loc1_.actionParameter);
                  if(_loc2_ != null)
                  {
                     this.var_202 = this.var_202.concat(_loc2_.spriteData);
                     if(_loc2_.hasDirectionData())
                     {
                        this.var_1717 = _loc2_.directionData.offset;
                     }
                     if(_loc2_.hasAvatarData())
                     {
                        this.var_569 = _loc2_.avatarData;
                     }
                  }
               }
               if(_loc1_.actionType == AvatarAction.const_330 || _loc1_.actionType == AvatarAction.WAVE || _loc1_.actionType == AvatarAction.const_396)
               {
                  this.var_988 = true;
               }
            }
         }
      }
      
      protected function getCache() : AvatarImageCache
      {
         if(this.var_261 == null)
         {
            this.var_261 = new AvatarImageCache(this._structure,this,this._assets,this._scale);
         }
         return this.var_261;
      }
      
      private function setActionToParts(param1:IActiveActionData, param2:int) : void
      {
         if(param1 == null || param1.definition == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            this.var_284 = param1;
            this.getCache().setGeometryType(param1.definition.geometryType);
         }
         this.getCache().setAction(param1,param2);
         this.var_607 = true;
      }
      
      private function resetBodyPartCache(param1:IActiveActionData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            this.var_284 = param1;
            this.getCache().setGeometryType(param1.definition.geometryType);
         }
         this.getCache().resetBodyPartCache(param1);
         this.var_607 = true;
      }
      
      public function get avatarSpriteData() : IAvatarDataContainer
      {
         return this.var_569;
      }
      
      private function convertToGrayscale(param1:BitmapData, param2:String = "CHANNELS_EQUAL") : BitmapData
      {
         var _loc3_:* = 0.33;
         var _loc4_:* = 0.33;
         var _loc5_:* = 0.33;
         switch(param2)
         {
            case "CHANNELS_UNIQUE":
               _loc3_ = 0.3;
               _loc4_ = 0.59;
               _loc5_ = 0.11;
               break;
            case "CHANNELS_RED":
               _loc3_ = 1;
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case "CHANNELS_GREEN":
               _loc3_ = 0;
               _loc4_ = 1;
               _loc5_ = 0;
               break;
            case "CHANNELS_BLUE":
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 1;
               break;
            case "CHANNELS_DESATURATED":
               _loc3_ = 0.3086;
               _loc4_ = 0.6094;
               _loc5_ = 0.082;
         }
         var _loc7_:Array = [_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,0,0,0,1,0];
         var _loc8_:ColorMatrixFilter = new ColorMatrixFilter(_loc7_);
         var _loc9_:BitmapData = new BitmapData(param1.width,param1.height,param1.transparent,4294967295);
         _loc9_.copyPixels(param1,param1.rect,new Point(0,0),null,null,false);
         _loc9_.applyFilter(_loc9_,_loc9_.rect,new Point(0,0),_loc8_);
         return _loc9_;
      }
      
      private function errorThis(param1:String) : void
      {
         Logger.log("[AvatarImageError] " + param1);
      }
      
      private function logThis(param1:String) : void
      {
      }
      
      public function getSubType() : int
      {
         return -1;
      }
      
      public function get petType() : int
      {
         return -1;
      }
      
      public function get petBreed() : int
      {
         return -1;
      }
      
      public function isPlaceholder() : Boolean
      {
         return false;
      }
   }
}
