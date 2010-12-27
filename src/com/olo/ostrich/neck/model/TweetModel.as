package com.olo.ostrich.neck.model
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.TweetModel")]
	public class TweetModel
	{
		public var id:String;
		public var screenName:String;
		public var message:String;
		public var imageURL:String;
	
		public function TweetModel()
		{
		}
	}
}