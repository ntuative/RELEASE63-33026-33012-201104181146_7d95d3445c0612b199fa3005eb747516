package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1907:String;
      
      private var var_2653:int;
      
      private var var_2652:int;
      
      private var var_1701:int;
      
      private var _id:int;
      
      private var var_2651:Boolean;
      
      private var _type:String;
      
      private var var_1908:String;
      
      private var var_1909:int;
      
      private var var_2656:String;
      
      private var var_2654:int;
      
      private var var_2655:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1907 = param1.readString();
         this.var_2653 = param1.readInteger();
         this.var_2652 = param1.readInteger();
         this.var_1701 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2651 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1908 = param1.readString();
         this.var_1909 = param1.readInteger();
         this.var_2656 = param1.readString();
         this.var_2654 = param1.readInteger();
         this.var_2655 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1908 = "";
         this.var_1909 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1907;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2653;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2652;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1701;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2651;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1908;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1909;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2654;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2655;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1907;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this.var_2656;
      }
   }
}
