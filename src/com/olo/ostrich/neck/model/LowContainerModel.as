package com.olo.ostrich.neck.model
{
	[Bindable] 
	[RemoteClass(alias="com.olo.ostrich.nest.model.LowContainerModel")]
	public class LowContainerModel
	{
		public var name:String;
		public var type:String;
		public var currentCount:int;
		public var standardCapacity:int;
		public var minCapacity:int;
		
		public function LowContainerModel()
		{
		}

	}
}