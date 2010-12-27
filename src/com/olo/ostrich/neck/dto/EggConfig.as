package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.EggConfig")]
	public class EggConfig implements ICloneable
	{
		public var id:Number;
		public var showTweets:Boolean;
		public var showFoursquare:Boolean;
		public var showScoreboard:Boolean;
		public var showVideo:Boolean;
		public var showBlockNews:Boolean;
		public var showSummaryNews:Boolean;
		public var showPhotos:Boolean;
		
		
		public function EggConfig()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:EggConfig = (target == null) ? new EggConfig() : EggConfig(target);
			
			clone.id = id;
			clone.showTweets = showTweets;
			clone.showFoursquare = showFoursquare;
			clone.showScoreboard = showScoreboard;
			clone.showVideo = showVideo;
			clone.showBlockNews = showBlockNews;
			clone.showSummaryNews = showSummaryNews;
			clone.showPhotos = showPhotos;
			
			return clone;
		}
		
	}
}