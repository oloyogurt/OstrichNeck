package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.InventoryItem")]
	public class InventoryItem implements ICloneable
	{
		// Keep in synch with server object
		static public const INVENTORY_CATEGORY_YOGURT:int = 1;
		static public const INVENTORY_CATEGORY_TOPPING:int = 2;
		static public const INVENTORY_CATEGORY_HOUSEHOLD:int = 3;
		static public const INVENTORY_CATEGORY_OTHER:int = 4;
		
		static private const SHELF_LIFE_DAYS:int = 1;
		static private const SHELF_LIFE_MONTHS:int = 2;
		static private const SHELF_LIFE_YEARS:int = 3;
		
		static private const INVENTORY_CATEGORY_YOGURT_STR:String = "Yogurt";
		static private const INVENTORY_CATEGORY_TOPPING_STR:String = "Topping";
		static private const INVENTORY_CATEGORY_HOUSEHOLD_STR:String = "Household";
		static private const INVENTORY_CATEGORY_OTHER_STR:String = "Other";
		
		static private const SHELF_LIFE_DAYS_STR:String = "Days";
		static private const SHELF_LIFE_MONTHS_STR:String = "Months";
		static private const SHELF_LIFE_YEARS_STR:String = "Years";

	
		public var id:Number;
		public var name:String;
		public var manufactureName:String;
		public var category:int;
		public var isbn:String;
		public var cost:Number;
		public var dateAdded:Date;
		public var shelfLife:int;
		public var shelfLifeDenomination:int;
		public var notes:String;
		public var active:Boolean;
		public var currentQuantity:int;
		
		public var distributor:Distributor;
		public var inventoryStorageVessel:InventoryStorageVessel;
		
		
		public function InventoryItem()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:InventoryItem = (target == null) ? new InventoryItem() : InventoryItem(target);
			
			clone.id = id;
			clone.name = name;
			clone.manufactureName = manufactureName;
			clone.category = category;
			clone.isbn = isbn;
			clone.cost = cost;
			clone.dateAdded = dateAdded;
			clone.shelfLife = shelfLife;
			clone.shelfLifeDenomination = shelfLifeDenomination;
			clone.notes = notes;
			clone.active = active;
			clone.currentQuantity = currentQuantity;
			clone.distributor = distributor;
			clone.inventoryStorageVessel = inventoryStorageVessel;
			
			return clone;
		}
		
		
		[Transient] static public function categoryStr(value:int):String
		{
			var rtnStr:String = INVENTORY_CATEGORY_OTHER_STR;
			
			if (value == INVENTORY_CATEGORY_YOGURT)
			{
				rtnStr = INVENTORY_CATEGORY_YOGURT_STR;
			}
			else if (value == INVENTORY_CATEGORY_TOPPING)
			{
				rtnStr = INVENTORY_CATEGORY_TOPPING_STR;
			}
			else if (value == INVENTORY_CATEGORY_HOUSEHOLD)
			{
				rtnStr = INVENTORY_CATEGORY_HOUSEHOLD_STR;
			}
		
			return rtnStr;
		}
		
		
		[Transient] public function get shelfLifeStr():String
		{
			var valueStr:String = "UNKNOWN";
			
			if (shelfLife == SHELF_LIFE_DAYS)
			{
				valueStr = SHELF_LIFE_DAYS_STR;
			}
			else if (shelfLife == SHELF_LIFE_MONTHS)
			{
				valueStr = SHELF_LIFE_MONTHS_STR;
			}
			else if (shelfLife == SHELF_LIFE_YEARS)
			{
				valueStr = SHELF_LIFE_YEARS_STR;
			}
			
			return valueStr;
		}
	}
}