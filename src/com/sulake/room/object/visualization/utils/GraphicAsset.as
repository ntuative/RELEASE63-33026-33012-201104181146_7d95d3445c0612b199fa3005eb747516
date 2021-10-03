package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1779:String;
      
      private var var_2568:String;
      
      private var var_443:BitmapDataAsset;
      
      private var var_1487:Boolean;
      
      private var var_1486:Boolean;
      
      private var var_2567:Boolean;
      
      private var _offsetX:int;
      
      private var var_1139:int;
      
      private var var_245:int;
      
      private var _height:int;
      
      private var var_749:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1779 = param1;
         this.var_2568 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_443 = _loc9_;
            this.var_749 = false;
         }
         else
         {
            this.var_443 = null;
            this.var_749 = true;
         }
         this.var_1487 = param4;
         this.var_1486 = param5;
         this._offsetX = param6;
         this.var_1139 = param7;
         this.var_2567 = param8;
      }
      
      public function dispose() : void
      {
         this.var_443 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_749 && this.var_443 != null)
         {
            _loc1_ = this.var_443.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_245 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_749 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1486;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1487;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_245;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1779;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2568;
      }
      
      public function get asset() : IAsset
      {
         return this.var_443;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2567;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1487)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1486)
         {
            return this.var_1139;
         }
         return -(this.height + this.var_1139);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1139;
      }
   }
}
