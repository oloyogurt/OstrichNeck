package com.olo.ostrich.neck.model
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.InventoryTotalsModel")]
	public class InventoryTotalsModel
	{
		public var yogurtTotal:Number;
		public var toppingsTotal:Number;
		public var householdsTotal:Number;
		public var otherTotal:Number;
		public var total:Number;		
		
		public function InventoryTotalsModel()
		{
		}
	}
}