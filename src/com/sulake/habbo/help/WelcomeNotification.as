package com.sulake.habbo.help
{
   public class WelcomeNotification
   {
       
      
      private var var_2356:String;
      
      private var var_2355:String;
      
      private var var_2357:String;
      
      public function WelcomeNotification(param1:String, param2:String, param3:String)
      {
         super();
         this.var_2356 = param1;
         this.var_2355 = param2;
         this.var_2357 = param3;
      }
      
      public function get targetIconId() : String
      {
         return this.var_2356;
      }
      
      public function get titleLocalizationKey() : String
      {
         return this.var_2355;
      }
      
      public function get descriptionLocalizationKey() : String
      {
         return this.var_2357;
      }
   }
}
