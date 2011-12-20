package com.olo.ostrich.neck.model
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.InventoryTotalsModel")]
	public class InventoryTotalsModel
	{
		public var yogurt:Number;
		public var topping:Number;
		public var foodOther:Number;
		public var cups:Number;
		public var napkins:Number;
		public var spoons:Number;
		public var merch:Number;
		public var nonFoodOther:Number;
		public var suppliesCleaning:Number;
		public var suppliesKitchen:Number;
		public var suppliesOther:Number;
		
		public var food:Number;
		public var nonFood:Number;
		public var supplies:Number;
		public var total:Number;		
		
		public function InventoryTotalsModel()
		{
		}
	}
}