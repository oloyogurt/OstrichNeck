package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.BlockNews")]
	public class BlockNews implements ICloneable
	{
		public var id:Number;
		public var active:Boolean;
		public var startDate:Date;
		public var endDate:Date;
		public var title:String;
		public var contentBody:String;
		public var bgColor:int;
		public var textColor:int;
		
				
		public function BlockNews()
		{
		}


		public function clone(target:*=null):*
		{
			var clone:BlockNews = (target == null) ? new BlockNews() : BlockNews(target);
			
			clone.id = id;
			clone.active = active;
			clone.startDate = startDate;
			clone.endDate = endDate;
			clone.title = title;
			clone.contentBody = contentBody;
			clone.bgColor = bgColor;
			clone.textColor = textColor;
			
			return clone;
		}
	}
}