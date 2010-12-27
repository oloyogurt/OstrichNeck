package com.olo.ostrich.neck.component
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	import mx.controls.Image;

	public class ScaledImage extends Image
	{
		public var frameHeight:int = 0;
		public var frameWidth:int = 0;		
				
				
		public function ScaledImage()
		{
			super();
		}
		
		
		public function set origURL(data:String):void
		{
			var request:URLRequest = new URLRequest(data);
			var imageLoader:Loader = new Loader();
			var loaderContext:LoaderContext = new LoaderContext();
			loaderContext.checkPolicyFile = true;
			imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImageLoad);
			Loader(imageLoader).load(request, loaderContext);
		}
		
		
		private function onImageLoad(event:Event):void
		{
		 	var bmd:BitmapData = Bitmap(event.currentTarget.content).bitmapData;
		 	
		 	// Find scale factor based on the pictures longest side
		 	var origWidth:Number = bmd.width;
		 	var origHeight:Number = bmd.height;
		 	
		 	var scaleFactor:Number = 0;
		 	var largestSize:Number = Math.max(origWidth, origHeight);
		 	if (largestSize == origWidth)
		 	{
		 		scaleFactor = maxWidth / largestSize;
		 	}
		 	else
		 	{
		 		scaleFactor = maxHeight / largestSize;
		 	}
		 				
		 	// Determine new size and scale
		 	var newWidth:int = bmd.width * scaleFactor;
		 	var newHeight:int = bmd.height * scaleFactor;
		 	
		 	var scaledBMP:BitmapData = new BitmapData(newWidth, newHeight, bmd.transparent);
		 	var matrix:Matrix = new Matrix();
		 	matrix.scale(scaleFactor, scaleFactor);
		 	scaledBMP.draw(bmd, matrix);
		 	
		 	bmd = scaledBMP;
		 	
		 	var bitmap:Bitmap = new Bitmap(bmd);
		 	this.source = bitmap;
		}
		
	}
}