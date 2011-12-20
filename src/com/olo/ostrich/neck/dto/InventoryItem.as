package com.olo.ostrich.neck.dto
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.InventoryItem")]
	public class InventoryItem implements ICloneable
	{
		// Keep in synch with server object
		static public const INVENTORY_CATEGORY_FOOD_YOGURT:int = 0;
		static public const INVENTORY_CATEGORY_FOOD_TOPPING:int = 1;
		static public const INVENTORY_CATEGORY_FOOD_DRINK:int = 2;
		static public const INVENTORY_CATEGORY_FOOD_OTHER:int = 3;
		static public const INVENTORY_CATEGORY_NON_FOOD_CUPS:int = 4;
		static public const INVENTORY_CATEGORY_NON_FOOD_NAPKINS:int = 5;
		static public const INVENTORY_CATEGORY_NON_FOOD_SPOONS:int = 6;
		static public const INVENTORY_CATEGORY_NON_FOOD_MERCHANDISE:int = 7;
		static public const INVENTORY_CATEGORY_NON_FOOD_OTHER:int = 8;
		static public const INVENTORY_CATEGORY_SUPPLIES_CLEANING:int = 9;
		static public const INVENTORY_CATEGORY_SUPPLIES_KITCHEN:int = 10;
		static public const INVENTORY_CATEGORY_SUPPLIES_OTHER:int = 11;
		
		static public const INVENTORY_LOCATION_WALK_IN_COOLER:int = 0;
		static public const INVENTORY_LOCATION_FREEZER:int = 1;
		static public const INVENTORY_LOCATION_DRY_FOOD_SHELVING:int = 2;
		static public const INVENTORY_LOCATION_STORAGE_SHELVING:int = 3;
		static public const INVENTORY_LOCATION_OTHER:int = 4;
			
		static private const SHELF_LIFE_DAYS:int = 0;
		static private const SHELF_LIFE_MONTHS:int = 1;
		static private const SHELF_LIFE_YEARS:int = 2;
		
		
		static public const INVENTORY_CATEGORY_FOOD_YOGURT_STR:String = "Yogurt";
		static public const INVENTORY_CATEGORY_FOOD_TOPPING_STR:String = "Topping";
		static public const INVENTORY_CATEGORY_FOOD_DRINK_STR:String = "Drink";
		static public const INVENTORY_CATEGORY_FOOD_OTHER_STR:String = "Food (Other)";
		static public const INVENTORY_CATEGORY_NON_FOOD_CUPS_STR:String = "Cups";
		static public const INVENTORY_CATEGORY_NON_FOOD_NAPKINS_STR:String = "Napkins";
		static public const INVENTORY_CATEGORY_NON_FOOD_SPOONS_STR:String = "Spoons";
		static public const INVENTORY_CATEGORY_NON_FOOD_MERCHANDISE_STR:String = "Merchandise";
		static public const INVENTORY_CATEGORY_NON_FOOD_OTHER_STR:String = "Non-Food (Other)";
		static public const INVENTORY_CATEGORY_SUPPLIES_CLEANING_STR:String = "Supplies (Cleaning)";
		static public const INVENTORY_CATEGORY_SUPPLIES_KITCHEN_STR:String = "Supplies (Kitchen)";
		static public const INVENTORY_CATEGORY_SUPPLIES_OTHER_STR:String = "Supplies (Other)";
		
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
																							 {label:"Drink", data:2},
																							 {label:"Food (Other)", data:3},
																							 {label:"Cups", data:3},
																							 {label:"Napkins", data:3},
																							 {label:"Spoons", data:3},
																							 {label:"Merchandise", data:3},
																							 {label:"Non-Food (Other)", data:3},
																							 {label:"Supplies (Cleaning)", data:3},
																							 {label:"Supplies (Kitchen)", data:3},
																							 {label:"Supplies (Other)", data:3}]);
																							 
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
		public var weightedOz:Number;
		public var lastOrderDate:Number;
		
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
			clone.lastOrderDate = lastOrderDate;
			
			clone.distributor = distributor;
			
			clone.itemDetail = itemDetail;
			
			clone.boxCount = boxCount;
			
			return clone;
		}
		
		
		[Transient] public function get lastOrderDateStr():Date
		{
			return new Date(lastOrderDate);
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
			return (distributor != null) ? distributor.name : "Unknown";
		}
		
		
		[Transient] public function get categoryStrValue():String
		{
			return categoryStr(this.category);
		}
		
		
		[Transient] static public function categoryStr(category:int):String
		{
			var value:String = "UNKNOWN";
			
			if (category == INVENTORY_CATEGORY_FOOD_YOGURT) {
				value = INVENTORY_CATEGORY_FOOD_YOGURT_STR;
			} else if (category == INVENTORY_CATEGORY_FOOD_TOPPING) {
				value = INVENTORY_CATEGORY_FOOD_TOPPING_STR;
			} else if (category == INVENTORY_CATEGORY_FOOD_DRINK) {
				value = INVENTORY_CATEGORY_FOOD_DRINK_STR;
			} else if (category == INVENTORY_CATEGORY_FOOD_OTHER) {
				value = INVENTORY_CATEGORY_FOOD_OTHER_STR;
			} else if (category == INVENTORY_CATEGORY_NON_FOOD_CUPS) {
				value = INVENTORY_CATEGORY_NON_FOOD_CUPS_STR;
			} else if (category == INVENTORY_CATEGORY_NON_FOOD_NAPKINS) {
				value = INVENTORY_CATEGORY_NON_FOOD_NAPKINS_STR;
			} else if (category == INVENTORY_CATEGORY_NON_FOOD_SPOONS) {
				value = INVENTORY_CATEGORY_NON_FOOD_SPOONS_STR;
			} else if (category == INVENTORY_CATEGORY_NON_FOOD_MERCHANDISE) {
				value = INVENTORY_CATEGORY_NON_FOOD_MERCHANDISE_STR;
			} else if (category == INVENTORY_CATEGORY_NON_FOOD_OTHER) {
				value = INVENTORY_CATEGORY_NON_FOOD_OTHER_STR;
			} else if (category == INVENTORY_CATEGORY_SUPPLIES_CLEANING) {
				value = INVENTORY_CATEGORY_SUPPLIES_CLEANING_STR;
			} else if (category == INVENTORY_CATEGORY_SUPPLIES_KITCHEN) {
				value = INVENTORY_CATEGORY_SUPPLIES_KITCHEN_STR;
			} else if (category == INVENTORY_CATEGORY_SUPPLIES_OTHER) {
				value = INVENTORY_CATEGORY_SUPPLIES_OTHER_STR;
			}
		
			return value;
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
			return (lastPricePaid / weightedOz);
		}
		
		[Transient] public function get avgPriceOz():Number
		{
			return (priceAvg / weightedOz);
		}
	}
}