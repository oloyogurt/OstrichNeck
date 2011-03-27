package com.olo.ostrich.neck.model
{
	[Bindable] 
	[RemoteClass(alias="com.olo.ostrich.nest.model.OldInventoryItemModel")]
	public class OldInventoryItemModel
	{
		public var name:String;
		public var category:String;
		public var oldestItemDate:Date;
		public var shelfLife:int;
		public var shelfLifeDenomination:String;
		
		public function OldInventoryItemModel()
		{
		}

	}
}