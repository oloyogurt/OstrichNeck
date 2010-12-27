package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.SummaryNews")]
	public class SummaryNews implements ICloneable
	{
		public var id:Number;
		public var active:Boolean;
		public var startDate:Date;
		public var endDate:Date;
		public var message:String;
		
		
		public function SummaryNews()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:SummaryNews = (target == null) ? new SummaryNews() : SummaryNews(target);
			
			clone.id = id;
			clone.active = active;
			clone.startDate = startDate;
			clone.endDate = endDate;
			clone.message = message;
			
			return clone;
		}
		
	}
}