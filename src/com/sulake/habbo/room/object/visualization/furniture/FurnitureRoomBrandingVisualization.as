package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class FurnitureRoomBrandingVisualization extends FurnitureVisualization
   {
      
      private static const const_1345:String = "branded_image";
       
      
      protected var _imageUrl:String;
      
      protected var var_1331:Boolean = false;
      
      public function FurnitureRoomBrandingVisualization()
      {
         super();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._imageUrl = null;
      }
      
      override protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         if(super.updateObject(param1,param2))
         {
            if(this.var_1331)
            {
               this.checkAndCreateImageForCurrentState(param1);
            }
            return true;
         }
         return false;
      }
      
      override protected function updateModel(param1:Number) : Boolean
      {
         var _loc2_:Boolean = super.updateModel(param1);
         if(!this.var_1331)
         {
            this.var_1331 = this.checkIfImageReady();
            if(this.var_1331)
            {
               this.checkAndCreateImageForCurrentState(param1);
               return true;
            }
         }
         else if(this.checkIfImageChanged())
         {
            this.var_1331 = false;
            this._imageUrl = null;
            return true;
         }
         return _loc2_;
      }
      
      protected function checkIfImageChanged() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:IRoomObject = object;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.getModel();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.getString(RoomObjectVariableEnum.const_314);
               if(_loc3_ != null && _loc3_ != this._imageUrl)
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      protected function checkIfImageReady() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:IRoomObject = object;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.getModel();
            if(_loc2_ != null)
            {
               _loc3_ = _loc2_.getString(RoomObjectVariableEnum.const_314);
               if(_loc3_ != null)
               {
                  if(this._imageUrl == null || this._imageUrl != _loc3_)
                  {
                     _loc4_ = _loc2_.getNumber(RoomObjectVariableEnum.const_552);
                     if(_loc4_ == 1)
                     {
                        _loc5_ = assetCollection.getAsset(_loc3_);
                        if(_loc5_ != null)
                        {
                           _loc6_ = _loc5_.asset.content as BitmapData;
                           if(_loc6_ != null)
                           {
                              this.imageReady(_loc6_.clone(),_loc3_);
                              return true;
                           }
                        }
                     }
                  }
               }
            }
         }
         return false;
      }
      
      override protected function updateSprites(param1:int, param2:Boolean, param3:int) : void
      {
         super.updateSprites(param1,param2,param3);
      }
      
      protected function imageReady(param1:BitmapData, param2:String) : void
      {
         Logger.log("billboard visualization got image from url = " + param2);
         if(param1 != null)
         {
            this._imageUrl = param2;
         }
         else
         {
            this._imageUrl = null;
         }
      }
      
      override protected function getSpriteAssetName(param1:int, param2:int) : String
      {
         var _loc7_:int = 0;
         var _loc3_:int = getSize(param1);
         var _loc4_:String = type;
         var _loc5_:String = "";
         if(param2 < spriteCount - 1)
         {
            _loc5_ = String.fromCharCode("a".charCodeAt() + param2);
         }
         else
         {
            _loc5_ = "sd";
         }
         if(_loc3_ == 1)
         {
            _loc4_ += "_icon_" + _loc5_;
         }
         else
         {
            _loc7_ = getFrameNumber(param1,param2);
            _loc4_ += "_" + _loc3_ + "_" + _loc5_ + "_" + direction + "_" + _loc7_;
         }
         var _loc6_:String = getSpriteTag(param1,direction,param2);
         if(this._imageUrl != null && _loc6_ == const_1345)
         {
            return this._imageUrl + "_" + _loc3_ + "_" + object.getState(0);
         }
         return _loc4_;
      }
      
      private function checkAndCreateImageForCurrentState(param1:int) : void
      {
         var _loc7_:* = null;
         var _loc13_:* = null;
         if(object == null || this._imageUrl == null)
         {
            return;
         }
         var _loc2_:IGraphicAsset = assetCollection.getAsset(this._imageUrl);
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = object.getState(0);
         var _loc4_:String = this._imageUrl + "_" + param1 + "_" + _loc3_;
         var _loc5_:IGraphicAsset = assetCollection.getAsset(_loc4_);
         if(_loc5_ != null)
         {
            return;
         }
         var _loc6_:BitmapData = _loc2_.asset.content as BitmapData;
         if(_loc6_ == null)
         {
            Logger.log("could not find bitmap data for image " + _loc4_);
            return;
         }
         if(param1 == 32)
         {
            _loc13_ = new Matrix();
            _loc13_.scale(0.5,0.5);
            _loc7_ = new BitmapData(_loc6_.width / 2,_loc6_.height / 2,true,16777215);
            _loc7_.draw(_loc6_,_loc13_);
         }
         else
         {
            _loc7_ = _loc6_.clone();
         }
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         switch(_loc3_)
         {
            case 0:
               _loc8_ = 0;
               _loc9_ = 0;
               _loc10_ = false;
               _loc11_ = false;
               break;
            case 1:
               _loc8_ = -_loc7_.width;
               _loc9_ = 0;
               _loc10_ = true;
               _loc11_ = false;
               break;
            case 2:
               _loc8_ = -_loc7_.width;
               _loc9_ = -_loc7_.height;
               _loc10_ = true;
               _loc11_ = true;
               break;
            case 3:
               _loc8_ = 0;
               _loc9_ = -_loc7_.height;
               _loc10_ = false;
               _loc11_ = true;
               break;
            default:
               Logger.log("could not handle unknown state " + _loc3_);
         }
         var _loc12_:Boolean = assetCollection.addAsset(_loc4_,_loc7_,true,_loc8_,_loc9_,_loc10_,_loc11_);
         if(!_loc12_)
         {
            Logger.log("could not add asset for image " + _loc4_);
         }
      }
   }
}
