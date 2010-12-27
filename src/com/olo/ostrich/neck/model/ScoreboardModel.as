package com.olo.ostrich.neck.model
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.ScoreboardModel")]
	public class ScoreboardModel
	{
		public var color:int;
		public var oloFlavorName:String;
		public var rank:int;
		public var trending:int;
		
		
		public function ScoreboardModel()
		{
		}

	}
}