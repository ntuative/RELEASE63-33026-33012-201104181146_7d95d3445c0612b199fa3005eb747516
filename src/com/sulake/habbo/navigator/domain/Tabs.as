package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_435:int = 1;
      
      public static const const_266:int = 2;
      
      public static const const_331:int = 3;
      
      public static const const_369:int = 4;
      
      public static const const_254:int = 5;
      
      public static const const_420:int = 1;
      
      public static const const_797:int = 2;
      
      public static const const_798:int = 3;
      
      public static const const_683:int = 4;
      
      public static const const_248:int = 5;
      
      public static const const_767:int = 6;
      
      public static const const_733:int = 7;
      
      public static const const_256:int = 8;
      
      public static const const_437:int = 9;
      
      public static const const_1856:int = 10;
      
      public static const const_929:int = 11;
      
      public static const const_621:int = 12;
       
      
      private var var_456:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_456 = new Array();
         this.var_456.push(new Tab(this._navigator,const_435,const_621,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_476));
         this.var_456.push(new Tab(this._navigator,const_266,const_420,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_476));
         this.var_456.push(new Tab(this._navigator,const_369,const_929,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1258));
         this.var_456.push(new Tab(this._navigator,const_331,const_248,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_476));
         this.var_456.push(new Tab(this._navigator,const_254,const_256,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_783));
         this.setSelectedTab(const_435);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_369;
      }
      
      public function get tabs() : Array
      {
         return this.var_456;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_456)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_456)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_456)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
