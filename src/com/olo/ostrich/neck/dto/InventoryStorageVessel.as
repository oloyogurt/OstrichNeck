package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.InventoryStorageVessel")]
	public class InventoryStorageVessel implements ICloneable
	{
		// Keep in synch with server object
		static private const STORAGE_TYPE_WALK_IN_COOLER:int = 1;
		static private const STORAGE_TYPE_WALK_IN_COOLER_STR:String = "Walk-in";
		static private const STORAGE_TYPE_FREEZER:int = 2;
		static private const STORAGE_TYPE_FREEZER_STR:String = "Freezer";
		static private const STORAGE_TYPE_SHELF:int = 3;
		static private const STORAGE_TYPE_SHELF_STR:String = "Shelving";
		
		
		public var id:Number;
		public var name:String;
		public var type:int;
		public var category:int;
		public var overstock:Boolean;
		public var standardCapacity:int;
		public var minCapacity:int;
		public var maxCapacity:int;
		public var containerInfo:String;
		
		
		public function InventoryStorageVessel()
		{
		}


		public function clone(target:*=null):*
		{
			var clone:InventoryStorageVessel = (target == null) ? new InventoryStorageVessel() : InventoryStorageVessel(target);
			
			clone.id = id;
			clone.name = name;
			clone.type = type;
			clone.category = category;
			clone.overstock = overstock;
			clone.standardCapacity = standardCapacity;
			clone.minCapacity = minCapacity;
			clone.maxCapacity = maxCapacity;
			clone.containerInfo = containerInfo;
			
			return clone;
		}
		
		
		[Transient] public function get categoryStr():String
		{
			return InventoryItem.categoryStr(category);
		}
		
		
		[Transient] public function get typeStr():String
		{
			var rtnStr:String = "UNKNOWN";
			
			if (type == STORAGE_TYPE_WALK_IN_COOLER)
			{
				rtnStr = STORAGE_TYPE_WALK_IN_COOLER_STR;
			}
			else if (type == STORAGE_TYPE_FREEZER)
			{
				rtnStr = STORAGE_TYPE_FREEZER_STR;
			}
			else if (type == STORAGE_TYPE_SHELF)
			{
				rtnStr = STORAGE_TYPE_SHELF_STR;
			}
			
			return rtnStr;
		}
		
	}
}