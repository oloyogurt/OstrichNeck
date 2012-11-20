package com.olo.ostrich.neck.dto
{
	import mx.collections.ArrayCollection;
	
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.InventoryOrderModel")]
	public class InventoryOrder implements ICloneable
	{
		public var id:Number;
		public var completed:Boolean;
		public var receiveDate:Date;
		public var invoiceNumber:String;
		public var total:Number;
		public var receivedBy:String;
		public var paid:Boolean;
		
		public var distributor:Distributor;
		public var orderItems:ArrayCollection;
		
		public function InventoryOrder()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:InventoryOrder = (target == null) ? new InventoryOrder() : InventoryOrder(target);
			
			clone.id = id;
			clone.completed = completed;
			clone.receiveDate = receiveDate;
			clone.invoiceNumber = invoiceNumber;
			clone.total = total;
			clone.receivedBy = receivedBy;
			clone.paid = paid;
			
			clone.distributor = distributor;
			
			if (orderItems != null)
			{
				clone.orderItems = new ArrayCollection();
				for each (var oi:InventoryOrderItem in orderItems)
				{
					clone.orderItems.addItem(oi.clone());
				}
			}
			
			return clone;
		}
		
		[Transient] public function get distributorName():String
		{
			return (distributor) ? distributor.name : "";
		}
		
	}
}