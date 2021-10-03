package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1213:Sound = null;
      
      private var var_429:SoundChannel = null;
      
      private var var_488:Number;
      
      private var _complete:Boolean;
      
      public function HabboSound(param1:Sound)
      {
         super();
         this.var_1213 = param1;
         this.var_1213.addEventListener(Event.COMPLETE,this.onComplete);
         this.var_488 = 1;
         this._complete = false;
      }
      
      public function play(param1:Number = 0.0) : Boolean
      {
         this._complete = false;
         this.var_429 = this.var_1213.play(0);
         this.volume = this.var_488;
         return true;
      }
      
      public function stop() : Boolean
      {
         this.var_429.stop();
         return true;
      }
      
      public function get volume() : Number
      {
         return this.var_488;
      }
      
      public function set volume(param1:Number) : void
      {
         this.var_488 = param1;
         if(this.var_429 != null)
         {
            this.var_429.soundTransform = new SoundTransform(this.var_488);
         }
      }
      
      public function get position() : Number
      {
         return this.var_429.position;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get length() : Number
      {
         return this.var_1213.length;
      }
      
      public function get ready() : Boolean
      {
         return !this.var_1213.isBuffering;
      }
      
      public function get finished() : Boolean
      {
         return !this._complete;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return 0;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
      }
      
      public function get fadeInSeconds() : Number
      {
         return 0;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
      }
      
      private function onComplete(param1:Event) : void
      {
         this._complete = true;
      }
   }
}
