package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.VideoInfo")]
	public class VideoInfo implements ICloneable
	{
		public var id:Number;
		public var description:String;
		public var url:String;
		public var videoId:String;
		
		
		public function VideoInfo()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:VideoInfo = (target == null) ? new VideoInfo() : VideoInfo(target);
			
			clone.id = id;
			clone.description = description;
			clone.url = url;
			clone.videoId = videoId;
			
			return clone;
		}
		
	}
}