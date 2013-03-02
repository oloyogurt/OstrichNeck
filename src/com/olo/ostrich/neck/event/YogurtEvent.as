package com.olo.ostrich.neck.event
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class YogurtEvent extends Event
	{
		static public const FETCH_ALL_YOGURTS:String = "fetchAllYogurts";
		static public const EDIT_YOGURT:String = "editYogurt";
		static public const REMOVE_YOGURT:String = "removeYogurt";
		static public const SAVE_YOGURT:String = "saveYogurt";
		
		public var yogurts:ArrayCollection = null;
				
		public function get locID():Number {
			return ConfigUtilitiesEvent.LOC_ID;
		}
		public function YogurtEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}