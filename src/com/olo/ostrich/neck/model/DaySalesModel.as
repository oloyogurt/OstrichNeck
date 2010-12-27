package com.olo.ostrich.neck.model
{
	[Bindable] 
	[RemoteClass(alias="com.olo.ostrich.nest.model.DaySalesModel")]
	public class DaySalesModel
	{
		public var day:String;
		public var cartons:int;
		
		
		public function DaySalesModel()
		{
		}

	}
}