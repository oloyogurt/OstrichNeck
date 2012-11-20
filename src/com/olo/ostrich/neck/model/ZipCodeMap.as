package com.olo.ostrich.neck.model
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.ZipCodeMap")]
	public class ZipCodeMap
	{
		public var zip:String;
		public var count:Number;
		public var percentOfTotal:Number;
		
		
		public function ZipCodeMap()
		{
		}

	}
}