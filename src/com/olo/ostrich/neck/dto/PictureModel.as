package com.olo.ostrich.neck.dto
{
	import flash.display.Bitmap;
	
	[Bindable] public class PictureModel
	{
		public var title:String;
		public var url:String;

		
		public function PictureModel(title:String, url:String):void
		{
			this.title = title;
			this.url = url;
		}

	}
}