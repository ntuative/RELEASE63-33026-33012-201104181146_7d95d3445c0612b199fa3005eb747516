package com.sulake.habbo.room.object.visualization.data
{
   public class AnimationLayerData
   {
       
      
      private var var_223:Array;
      
      private var var_425:int = -1;
      
      private var _loopCount:int = 1;
      
      private var var_1800:int = 1;
      
      private var var_1799:Boolean = false;
      
      public function AnimationLayerData(param1:int, param2:int, param3:Boolean)
      {
         this.var_223 = [];
         super();
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         this._loopCount = param1;
         this.var_1800 = param2;
         this.var_1799 = param3;
      }
      
      public function get frameCount() : int
      {
         if(this.var_425 < 0)
         {
            this.calculateLength();
         }
         return this.var_425;
      }
      
      public function dispose() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_223.length)
         {
            _loc2_ = this.var_223[_loc1_] as AnimationFrameSequenceData;
            if(_loc2_ != null)
            {
               _loc2_.dispose();
            }
            _loc1_++;
         }
         this.var_223 = [];
      }
      
      public function addFrameSequence(param1:int, param2:Boolean) : AnimationFrameSequenceData
      {
         var _loc3_:AnimationFrameSequenceData = new AnimationFrameSequenceData(param1,param2);
         this.var_223.push(_loc3_);
         return _loc3_;
      }
      
      public function calculateLength() : void
      {
         var _loc2_:* = null;
         this.var_425 = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_223.length)
         {
            _loc2_ = this.var_223[_loc1_] as AnimationFrameSequenceData;
            if(_loc2_ != null)
            {
               this.var_425 += _loc2_.frameCount;
            }
            _loc1_++;
         }
      }
      
      public function getFrame(param1:int, param2:int) : AnimationFrame
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this.var_425 < 1)
         {
            return null;
         }
         var _loc3_:* = null;
         param2 /= this.var_1800;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         if(!this.var_1799)
         {
            _loc6_ = param2 / this.var_425;
            param2 %= this.var_425;
            if(this._loopCount > 0 && _loc6_ >= this._loopCount || this._loopCount <= 0 && this.var_425 == 1)
            {
               param2 = this.var_425 - 1;
               _loc4_ = true;
            }
            _loc7_ = 0;
            _loc5_ = 0;
            while(_loc5_ < this.var_223.length)
            {
               _loc3_ = this.var_223[_loc5_] as AnimationFrameSequenceData;
               if(_loc3_ != null)
               {
                  if(param2 < _loc7_ + _loc3_.frameCount)
                  {
                     break;
                  }
                  _loc7_ += _loc3_.frameCount;
               }
               _loc5_++;
            }
            return this.getFrameFromSpecificSequence(param1,_loc3_,_loc5_,param2 - _loc7_,_loc4_);
         }
         _loc5_ = this.var_223.length * Math.random();
         _loc3_ = this.var_223[_loc5_] as AnimationFrameSequenceData;
         if(_loc3_.frameCount < 1)
         {
            return null;
         }
         param2 = 0;
         return this.getFrameFromSpecificSequence(param1,_loc3_,_loc5_,param2,false);
      }
      
      public function getFrameFromSequence(param1:int, param2:int, param3:int, param4:int) : AnimationFrame
      {
         if(param2 < 0 || param2 >= this.var_223.length)
         {
            return null;
         }
         var _loc5_:AnimationFrameSequenceData = this.var_223[param2] as AnimationFrameSequenceData;
         if(_loc5_ != null)
         {
            if(param3 >= _loc5_.frameCount)
            {
               return this.getFrame(param1,param4);
            }
            return this.getFrameFromSpecificSequence(param1,_loc5_,param2,param3,false);
         }
         return null;
      }
      
      private function getFrameFromSpecificSequence(param1:int, param2:AnimationFrameSequenceData, param3:int, param4:int, param5:Boolean) : AnimationFrame
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:Boolean = false;
         var _loc15_:* = null;
         if(param2 != null)
         {
            _loc6_ = param2.getFrameIndex(param4);
            _loc7_ = param2.getFrame(_loc6_);
            if(_loc7_ == null)
            {
               return null;
            }
            _loc8_ = _loc7_.getX(param1);
            _loc9_ = _loc7_.getY(param1);
            _loc10_ = _loc7_.randomX;
            _loc11_ = _loc7_.randomY;
            if(_loc10_ != 0)
            {
               _loc8_ += _loc10_ * Math.random();
            }
            if(_loc11_ != 0)
            {
               _loc9_ += _loc11_ * Math.random();
            }
            _loc12_ = _loc7_.method_2;
            if(_loc12_ > 1)
            {
               _loc12_ = param2.getRepeats(_loc6_);
            }
            _loc13_ = this.var_1800 * _loc12_;
            if(param5)
            {
               _loc13_ = 0;
            }
            _loc14_ = false;
            if(!this.var_1799 && !param2.isRandom)
            {
               if(param3 == this.var_223.length - 1 && param4 == param2.frameCount - 1)
               {
                  _loc14_ = true;
               }
            }
            return AnimationFrame.allocate(_loc7_.id,_loc8_,_loc9_,_loc12_,_loc13_,_loc14_,param3,param4);
         }
         return null;
      }
   }
}