package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1906:int = 0;
      
      public static const const_1584:int = 1;
      
      public static const const_1606:int = 2;
      
      public static const const_1927:int = 3;
      
      public static const const_2026:int = 4;
      
      public static const const_1910:int = 5;
      
      public static const const_1531:int = 10;
      
      public static const const_1998:int = 11;
      
      public static const const_1889:int = 12;
      
      public static const const_2045:int = 13;
      
      public static const const_1883:int = 16;
      
      public static const const_1895:int = 17;
      
      public static const const_1879:int = 18;
      
      public static const const_1861:int = 19;
      
      public static const const_1961:int = 20;
      
      public static const const_1992:int = 22;
      
      public static const const_1912:int = 23;
      
      public static const const_1970:int = 24;
      
      public static const const_1941:int = 25;
      
      public static const const_2021:int = 26;
      
      public static const const_1847:int = 27;
      
      public static const const_1938:int = 28;
      
      public static const const_1955:int = 29;
      
      public static const const_1866:int = 100;
      
      public static const const_1933:int = 101;
      
      public static const const_1894:int = 102;
      
      public static const const_2041:int = 103;
      
      public static const const_1860:int = 104;
      
      public static const const_1947:int = 105;
      
      public static const const_1874:int = 106;
      
      public static const const_2039:int = 107;
      
      public static const const_1875:int = 108;
      
      public static const const_1983:int = 109;
      
      public static const const_1865:int = 110;
      
      public static const const_1929:int = 111;
      
      public static const const_1969:int = 112;
      
      public static const const_1926:int = 113;
      
      public static const const_1987:int = 114;
      
      public static const const_1869:int = 115;
      
      public static const const_1962:int = 116;
      
      public static const const_1975:int = 117;
      
      public static const const_2000:int = 118;
      
      public static const const_1950:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1584:
            case const_1531:
               return "banned";
            case const_1606:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
