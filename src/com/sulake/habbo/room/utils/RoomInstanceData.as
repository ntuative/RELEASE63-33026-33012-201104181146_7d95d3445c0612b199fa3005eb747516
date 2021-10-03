package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_785:TileHeightMap = null;
      
      private var var_1191:LegacyWallGeometry = null;
      
      private var var_1192:RoomCamera = null;
      
      private var var_786:SelectedRoomObjectData = null;
      
      private var var_787:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_526:Map;
      
      private var var_527:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_526 = new Map();
         this.var_527 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1191 = new LegacyWallGeometry();
         this.var_1192 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_785;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_785 != null)
         {
            this.var_785.dispose();
         }
         this.var_785 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1191;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1192;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_786;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_786 != null)
         {
            this.var_786.dispose();
         }
         this.var_786 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_787;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_787 != null)
         {
            this.var_787.dispose();
         }
         this.var_787 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_785 != null)
         {
            this.var_785.dispose();
            this.var_785 = null;
         }
         if(this.var_1191 != null)
         {
            this.var_1191.dispose();
            this.var_1191 = null;
         }
         if(this.var_1192 != null)
         {
            this.var_1192.dispose();
            this.var_1192 = null;
         }
         if(this.var_786 != null)
         {
            this.var_786.dispose();
            this.var_786 = null;
         }
         if(this.var_787 != null)
         {
            this.var_787.dispose();
            this.var_787 = null;
         }
         if(this.var_526 != null)
         {
            this.var_526.dispose();
            this.var_526 = null;
         }
         if(this.var_527 != null)
         {
            this.var_527.dispose();
            this.var_527 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_526.remove(param1.id);
            this.var_526.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_526.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_526.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_526.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_527.remove(param1.id);
            this.var_527.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_527.length > 0)
         {
            return this.getWallItemDataWithId(this.var_527.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_527.remove(param1);
      }
   }
}
