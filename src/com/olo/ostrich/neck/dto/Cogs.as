package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.Cogs")]
	public class Cogs implements ICloneable
	{
		public var id:Number;
		public var entryTimeStamp:Number;
		public var quantity:Number;
		public var totalValue:Number;
		
		public var inventoryItem:InventoryItem;
		
		
		public function Cogs()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:Cogs = (target == null) ? new Cogs() : Cogs(target);
			
			clone.id = id;
			clone.entryTimeStamp = entryTimeStamp;
			clone.quantity = quantity;
			clone.totalValue = totalValue;
			
			if (inventoryItem != null) clone.inventoryItem = inventoryItem;
			
			return clone;
		}
	}
}