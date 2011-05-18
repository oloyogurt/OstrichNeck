package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.InventoryOrderItem")]
	public class InventoryOrderItem implements ICloneable
	{
		public var id:Number;
		public var purchasedUnitPrice:Number;
		public var caseQuantity:int;
		public var extendedPrice:Number;

		public var order:InventoryOrder;
		public var inventoryItem:InventoryItem;
		
		
		public function InventoryOrderItem()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:InventoryOrderItem = (target == null) ? new InventoryOrderItem() : InventoryOrderItem(target);
			
			clone.id = id;
			clone.purchasedUnitPrice = purchasedUnitPrice;
			clone.caseQuantity = caseQuantity;
			clone.extendedPrice = extendedPrice;
			
			clone.order = order;
			clone.inventoryItem = inventoryItem;
			
			return clone;
		}
		
		
		[Transient] public function get itemName():String
		{
			return (inventoryItem != null) ? inventoryItem.name : "";
		}
		
		
		[Transient] public function get itemNumber():String
		{
			return (inventoryItem != null) ? inventoryItem.itemNumber : "";
		}
		
		
		[Transient] public function get isTaxable():String
		{
			var taxable:String = "?";
			
			if (inventoryItem != null)
			{
				taxable = (inventoryItem.taxable == true) ? "Yes" : "No";
			}
			
			return taxable;
		}
		
		
		[Transient] public function get currentQuantity():Number
		{
			var value:Number = NaN;
			
			if (inventoryItem != null)
			{
				value = inventoryItem.currentQuantity;
			}
			
			return value;
		}
		
		
		[Transient] public function get reorderPoint():Number
		{
			var value:Number = NaN;
			
			if (inventoryItem != null)
			{
				value = inventoryItem.reorderPoint;
			}
			
			return value;
		} 
		
	}
}