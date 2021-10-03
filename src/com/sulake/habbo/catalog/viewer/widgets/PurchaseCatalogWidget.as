package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2844:XML;
      
      private var var_2846:XML;
      
      private var var_2845:XML;
      
      private var var_1053:IWindowContainer;
      
      private var var_685:IButtonWindow;
      
      private var var_2975:IButtonWindow;
      
      private var var_2045:ITextWindow;
      
      private var var_2046:ITextWindow;
      
      private var var_2044:ITextWindow;
      
      private var var_2945:ITextWindow;
      
      private var var_90:Offer;
      
      private var var_2043:String = "";
      
      private var var_1580:Function;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         events.removeEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.removeEventListener(WidgetEvent.const_871,this.onSetParameter);
         events.removeEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2844 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2846 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2845 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_871,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         events.addEventListener(WidgetEvent.CWE_INIT_PURCHASE,this.initPurchase);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1580 = param1.callback;
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_698:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2844) as IWindowContainer;
               break;
            case Offer.const_1236:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2846) as IWindowContainer;
               break;
            case Offer.const_1246:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2845) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_90.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_1053 != null)
            {
               _window.removeChild(this.var_1053);
               this.var_1053.dispose();
            }
            this.var_1053 = _loc2_;
            _window.addChild(_loc2_);
            this.var_1053.x = 0;
            this.var_1053.y = 0;
         }
         this.var_2045 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_2046 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_2044 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2945 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_685 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_685 != null)
         {
            if(this.var_1580 != null)
            {
               this.var_685.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1580);
            }
            else
            {
               this.var_685.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1580);
               this.var_685.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_685.disable();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_90 = param1.offer;
         this.attachStub(this.var_90.priceType);
         if(this.var_2045 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_90.priceInCredits));
            this.var_2045.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_90.activityPointType == Purse.const_192 ? "pixels" : "activitypoints";
         if(this.var_2046 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_90.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_90.priceInActivityPoints.toString());
            this.var_2046.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_2044 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_90.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_90.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_90.priceInActivityPoints));
            this.var_2044.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_90.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_685 != null)
         {
            this.var_685.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_2043 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_90 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_90,page.pageId,this.var_2043);
         }
      }
      
      private function initPurchase(param1:CatalogWidgetInitPurchaseEvent) : void
      {
         if(this.var_90 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_90,page.pageId,this.var_2043,param1.enableBuyAsGift);
         }
      }
   }
}
