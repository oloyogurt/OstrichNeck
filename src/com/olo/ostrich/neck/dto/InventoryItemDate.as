package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.InventoryItemDate")]
	public class InventoryItemDate implements ICloneable
	{
		public var id:Number;
		public var itemCount:int;
		public var year:int;
		public var month:int;
		public var day:int;
		public var dayOfWeek:int;
		
		public var inventoryItem:InventoryItem;
		
		public function InventoryItemDate()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:InventoryItemDate = (target == null) ? new InventoryItemDate() : InventoryItemDate(target);
			
			clone.id = id;
			clone.itemCount = itemCount;
			clone.year = year;
			clone.month = month;
			clone.day = day;
			clone.dayOfWeek = dayOfWeek;
			
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