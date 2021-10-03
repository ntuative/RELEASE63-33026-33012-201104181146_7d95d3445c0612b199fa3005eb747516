package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_921:BigInteger;
      
      private var var_2560:BigInteger;
      
      private var var_1860:BigInteger;
      
      private var var_2559:BigInteger;
      
      private var var_1483:BigInteger;
      
      private var var_1861:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1483 = param1;
         this.var_1861 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1483.toString() + ",generator: " + this.var_1861.toString() + ",secret: " + param1);
         this.var_921 = new BigInteger();
         this.var_921.fromRadix(param1,param2);
         this.var_2560 = this.var_1861.modPow(this.var_921,this.var_1483);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1860 = new BigInteger();
         this.var_1860.fromRadix(param1,param2);
         this.var_2559 = this.var_1860.modPow(this.var_921,this.var_1483);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2560.method_6(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2559.method_6(param1);
      }
   }
}
