package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2291:int;
      
      private var var_1533:String;
      
      private var var_2649:int;
      
      private var var_2648:int;
      
      private var _category:int;
      
      private var var_2121:String;
      
      private var var_1404:int;
      
      private var var_2650:int;
      
      private var var_2645:int;
      
      private var var_2646:int;
      
      private var var_2647:int;
      
      private var var_2644:Boolean;
      
      private var var_2970:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2291 = param1;
         this.var_1533 = param2;
         this.var_2649 = param3;
         this.var_2648 = param4;
         this._category = param5;
         this.var_2121 = param6;
         this.var_1404 = param7;
         this.var_2650 = param8;
         this.var_2645 = param9;
         this.var_2646 = param10;
         this.var_2647 = param11;
         this.var_2644 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2291;
      }
      
      public function get itemType() : String
      {
         return this.var_1533;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2649;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2648;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2121;
      }
      
      public function get extra() : int
      {
         return this.var_1404;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2650;
      }
      
      public function get creationDay() : int
      {
         return this.var_2645;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2646;
      }
      
      public function get creationYear() : int
      {
         return this.var_2647;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2644;
      }
      
      public function get songID() : int
      {
         return this.var_1404;
      }
   }
}
