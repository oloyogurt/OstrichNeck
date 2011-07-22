package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.OstrichMetaData")]
	public class OstrichMetaData implements ICloneable
	{
		public var id:Number;
		public var lastCountsUpdate:Date;
		
		
		public function OstrichMetaData()
		{
			lastCountsUpdate = new Date();
		}


		public function clone(target:*=null):*
		{
			var clone:OstrichMetaData = (target == null) ? new OstrichMetaData() : OstrichMetaData(target);
			
			clone.id = id;
			clone.lastCountsUpdate = lastCountsUpdate;
			
			return clone;
		}
		
	}
}