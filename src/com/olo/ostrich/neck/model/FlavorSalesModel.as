package com.olo.ostrich.neck.model
{
	import mx.collections.ArrayCollection;
	
	[Bindable] 
	[RemoteClass(alias="com.olo.ostrich.nest.model.FlavorSalesModel")]
	public class FlavorSalesModel
	{
		public var name:String;
		public var dataList:ArrayCollection = new ArrayCollection();
		
		
		public function FlavorSalesModel()
		{
		}

	}
}