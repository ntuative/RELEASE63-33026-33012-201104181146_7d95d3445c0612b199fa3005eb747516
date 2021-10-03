package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2011:int = 1;
      
      public static const const_1557:int = 2;
       
      
      private var var_1020:String;
      
      private var var_2773:int;
      
      private var var_2775:int;
      
      private var var_2772:int;
      
      private var var_2776:int;
      
      private var var_2778:Boolean;
      
      private var var_2313:Boolean;
      
      private var var_2436:int;
      
      private var var_2437:int;
      
      private var var_2777:Boolean;
      
      private var var_2779:int;
      
      private var var_2774:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1020 = param1.readString();
         this.var_2773 = param1.readInteger();
         this.var_2775 = param1.readInteger();
         this.var_2772 = param1.readInteger();
         this.var_2776 = param1.readInteger();
         this.var_2778 = param1.readBoolean();
         this.var_2313 = param1.readBoolean();
         this.var_2436 = param1.readInteger();
         this.var_2437 = param1.readInteger();
         this.var_2777 = param1.readBoolean();
         this.var_2779 = param1.readInteger();
         this.var_2774 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1020;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2773;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2775;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2772;
      }
      
      public function get responseType() : int
      {
         return this.var_2776;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2778;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2313;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2436;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2437;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2777;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2779;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2774;
      }
   }
}
