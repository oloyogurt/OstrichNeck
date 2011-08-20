package com.olo.ostrich.neck.dto
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.InventoryItem")]
	public class InventoryItem implements ICloneable
	{
		// Keep in synch with server object
		static public const INVENTORY_CATEGORY_YOGURT:int = 0;
		static public const INVENTORY_CATEGORY_TOPPING:int = 1;
		static public const INVENTORY_CATEGORY_HOUSEHOLD:int = 2;
		static public const INVENTORY_CATEGORY_OTHER:int = 3;
		
		static public const INVENTORY_LOCATION_WALK_IN_COOLER:int = 0;
		static public const INVENTORY_LOCATION_FREEZER:int = 1;
		static public const INVENTORY_LOCATION_DRY_FOOD_SHELVING:int = 2;
		static public const INVENTORY_LOCATION_STORAGE_SHELVING:int = 3;
		static public const INVENTORY_LOCATION_OTHER:int = 4;
			
		static private const SHELF_LIFE_DAYS:int = 0;
		static private const SHELF_LIFE_MONTHS:int = 1;
		static private const SHELF_LIFE_YEARS:int = 2;
		
		static public const INVENTORY_CATEGORY_YOGURT_STR:String = "Yogurt";
		static public const INVENTORY_CATEGORY_TOPPING_STR:String = "Topping";
		static public const INVENTORY_CATEGORY_HOUSEHOLD_STR:String = "Household";
		static public const INVENTORY_CATEGORY_OTHER_STR:String = "Other";
		
		static private const INVENTORY_LOCATION_WALK_IN_COOLER_STR:String = "Walk-in Cooler";
		static private const INVENTORY_LOCATION_FREEZER_STR:String = "Freezer";
		static private const INVENTORY_LOCATION_DRY_FOOD_SHELVING_STR:String = "Dry Food Shelving";
		static private const INVENTORY_LOCATION_STORAGE_SHELVING_STR:String = "Storage Shelving";
		static private const INVENTORY_LOCATION_OTHER_STR:String = "Other";		
		
		static private const SHELF_LIFE_DAYS_STR:String = "Days";
		static private const SHELF_LIFE_MONTHS_STR:String = "Months";
		static private const SHELF_LIFE_YEARS_STR:String = "Years";
		
		[Transient] static public var SHELF_LIFE_DENOMINATIONS:ArrayCollection = new ArrayCollection([{label:"Days", data:0},
																							   		  {label:"Months", data:1},
																			  				   		  {label:"Years", datat:2}]);
																			  				   		  
		[Transient] static public var INVENTORY_TYPES:ArrayCollection = new ArrayCollection([{label:"Yogurt", data:0},
																							 {label:"Topping", data:1},
																							 {label:"Household", data:2},
																							 {label:"Other", data:3}]);
																							 
		[Transient] static public var INVENTORY_LOCATIONS:ArrayCollection = new ArrayCollection([{label:"Walk-in", data:0},
																								 {label:"Freezer", data:1},
																								 {label:"Food Shelving", data:2},
																								 {label:"Storage Shelving", data:3},
																								 {label:"Other", data:4}]);
	
		public var id:Number;
		public var name:String;
		public var manufactureName:String;
		public var itemsInCase:int;
		public var category:int;
		public var location:int;
		public var itemNumber:String;
		public var lastPricePaid:Number;
		public var priceAvg:Number;
		public var newestDate:Date;
		public var oldestDate:Date;
		public var shelfLife:int;
		public var shelfLifeDenomination:int;
		public var taxable:Boolean;
		public var notes:String;
		public var reorder:Boolean;
		public var currentQuantity:Number;
		public var reorderPoint:Number;
		public var reorderPointText:String;
		public var show:Boolean;
		public var weightedOz:int;
		
		public var distributor:Distributor;
		public var itemDetail:ItemDetailBase;
		
		[Transient] public var boxCount:int = 0; 
		
		
		public function InventoryItem()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:InventoryItem = (target == null) ? new InventoryItem() : InventoryItem(target);
			
			clone.id = id;
			clone.name = name;
			clone.manufactureName = manufactureName;
			clone.itemsInCase = itemsInCase;
			clone.category = category;
			clone.location = location;
			clone.itemNumber = itemNumber;
			clone.lastPricePaid = lastPricePaid;
			clone.priceAvg = priceAvg;
			clone.newestDate = newestDate;
			clone.oldestDate = oldestDate;
			clone.shelfLife = shelfLife;
			clone.shelfLifeDenomination = shelfLifeDenomination;
			clone.taxable = taxable;
			clone.notes = notes;
			clone.reorder = reorder;
			clone.currentQuantity = currentQuantity;
			clone.reorderPoint = reorderPoint;
			clone.reorderPointText = reorderPointText;
			clone.show = show;
			clone.weightedOz = weightedOz;
			
			clone.distributor = distributor;
			
			clone.itemDetail = itemDetail;
			
			clone.boxCount = boxCount;
			
			return clone;
		}
		
		
		[Transient] public function get categoryAttStr():String
		{
			return categoryStr(category);
		}
		
		
		// Used for hierarchical data grid
		[Transient] public function get inventoryItemName():String
		{
			return name;
		}
		
		
		[Transient] public function get distribName():String
		{
			var name:String = "";
			
			if (distributor != null)
			{
				name = distributor.name;
			}
			
			return name;
		}
		
		
		[Transient] public function get categoryStrValue():String
		{
			return categoryStr(this.category);
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
		
		
		[Transient] public function get locationStrValue():String
		{
			return locationStr(this.location);
		}
		
		
		[Transient] static public function locationStr(value:int):String
		{
			var rtnStr:String = INVENTORY_LOCATION_OTHER_STR;
			
			if (value == INVENTORY_LOCATION_WALK_IN_COOLER)
			{
				rtnStr = INVENTORY_LOCATION_WALK_IN_COOLER_STR;
			}
			else if (value == INVENTORY_LOCATION_FREEZER)
			{
				rtnStr = INVENTORY_LOCATION_FREEZER_STR;
			}
			else if (value == INVENTORY_LOCATION_DRY_FOOD_SHELVING)
			{
				rtnStr = INVENTORY_LOCATION_DRY_FOOD_SHELVING_STR;
			}
			else if (value == INVENTORY_LOCATION_STORAGE_SHELVING)
			{
				rtnStr = INVENTORY_LOCATION_STORAGE_SHELVING_STR;
			}
			
			return rtnStr;
		}
		
		
		[Transient] public function get shelfLifeStr():String
		{
			var valueStr:String = "UNKNOWN";
			
			if (shelfLifeDenomination == SHELF_LIFE_DAYS)
			{
				valueStr = SHELF_LIFE_DAYS_STR;
			}
			else if (shelfLifeDenomination == SHELF_LIFE_MONTHS)
			{
				valueStr = SHELF_LIFE_MONTHS_STR;
			}
			else if (shelfLifeDenomination == SHELF_LIFE_YEARS)
			{
				valueStr = SHELF_LIFE_YEARS_STR;
			}
			
			return valueStr;
		}
		
		
		[Transient] public function get oldestItemDays():int
		{
			var days:int = 0;
			
			if (oldestDate)
			{
				var today:Date = new Date();
				days = today.time - oldestDate.time;
				days = days / 1000 / 60 / 60 / 24;
				if (days < 0) days = 0;
			}
			return days;
		}
		
		
		[Transient] public function get lastPricePaidOz():Number
		{
			return ((lastPricePaid / itemsInCase) / weightedOz);
		}
		
		[Transient] public function get avgPriceOz():Number
		{
			return ((priceAvg / itemsInCase) / weightedOz);
		}
	}
}