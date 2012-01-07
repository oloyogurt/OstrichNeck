package com.olo.ostrich.neck.model
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.BulkYogurtUsageModel")]
	public class BulkYogurtUsageModel
	{
		public var machineNumber:Number;
		public var hopper1Increment:int;
		public var hopper2Increment:int;
		public var activeDate:Date;
		
		
		public function BulkYogurtUsageModel()
		{
		}

	}
}