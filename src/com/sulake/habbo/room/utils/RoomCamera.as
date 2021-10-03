package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1389:Number = 12;
       
      
      private var var_2515:int = -1;
      
      private var var_2516:int = -2;
      
      private var var_207:Vector3d = null;
      
      private var var_1187:Number = 0;
      
      private var var_1834:Number = 0;
      
      private var var_1837:Boolean = false;
      
      private var var_180:Vector3d = null;
      
      private var var_1835:Vector3d;
      
      private var var_2514:Boolean = false;
      
      private var var_2519:Boolean = false;
      
      private var var_2511:Boolean = false;
      
      private var var_2518:Boolean = false;
      
      private var var_2520:int = 0;
      
      private var var_2512:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2517:int = 0;
      
      private var var_2513:int = 0;
      
      private var var_1675:int = -1;
      
      private var var_1836:int = 0;
      
      private var var_1838:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1835 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_180;
      }
      
      public function get targetId() : int
      {
         return this.var_2515;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2516;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1835;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2514;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2519;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2511;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2518;
      }
      
      public function get screenWd() : int
      {
         return this.var_2520;
      }
      
      public function get screenHt() : int
      {
         return this.var_2512;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2517;
      }
      
      public function get roomHt() : int
      {
         return this.var_2513;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1675;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_207 != null && this.var_180 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2515 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1835.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2516 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2514 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2519 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2511 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2518 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2520 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2512 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1838 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2517 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2513 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1675 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_207 == null)
         {
            this.var_207 = new Vector3d();
         }
         if(this.var_207.x != param1.x || this.var_207.y != param1.y || this.var_207.z != param1.z)
         {
            this.var_207.assign(param1);
            this.var_1836 = 0;
            _loc2_ = Vector3d.dif(this.var_207,this.var_180);
            this.var_1187 = _loc2_.length;
            this.var_1837 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_207 = null;
         this.var_180 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_180 != null)
         {
            return;
         }
         this.var_180 = new Vector3d();
         this.var_180.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_180 == null)
         {
            this.var_180 = new Vector3d();
         }
         this.var_180.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_207 != null && this.var_180 != null)
         {
            ++this.var_1836;
            if(this.var_1838)
            {
               this.var_1838 = false;
               this.var_180 = this.var_207;
               this.var_207 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_207,this.var_180);
            if(_loc3_.length > this.var_1187)
            {
               this.var_1187 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_180 = this.var_207;
               this.var_207 = null;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1187);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1187 / const_1389;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1837)
               {
                  if(_loc7_ < this.var_1834)
                  {
                     _loc7_ = this.var_1834;
                  }
                  else
                  {
                     this.var_1837 = false;
                  }
               }
               this.var_1834 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_180 = Vector3d.sum(this.var_180,_loc3_);
            }
         }
      }
   }
}
