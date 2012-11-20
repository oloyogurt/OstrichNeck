package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.InventoryItemDate")]
	public class InventoryItemDate implements ICloneable
	{
		public var id:Number;
		public var currentCount:Number;
		public var purchasedCount:Number;
		public var year:int;
		public var month:int;
		public var day:int;
		public var dayOfWeek:int;
		public var itemPrice:Number;
		public var totalPurchasedPrice:Number;
		public var addedTimestamp:Number;
		
		public var inventoryItem:InventoryItem;
		
		public function InventoryItemDate()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:InventoryItemDate = (target == null) ? new InventoryItemDate() : InventoryItemDate(target);
			
			clone.id = id;
			clone.currentCount = currentCount;
			clone.purchasedCount = purchasedCount;
			clone.year = year;
			clone.month = month;
			clone.day = day;
			clone.dayOfWeek = dayOfWeek;
			clone.itemPrice = itemPrice;
			clone.addedTimestamp = addedTimestamp;
			
			if (inventoryItem != null) clone.inventoryItem = inventoryItem;
			
			return clone;
		}
		
		[Transient] public function get dateFormat():Date
		{
			return new Date(year, month, day);
		}
		
		
		public function set dateFormat(d:Date):void
		{
			year = d.fullYear;
			month = d.month;
			day = d.date;
			dayOfWeek = d.day;
		}
	}
}