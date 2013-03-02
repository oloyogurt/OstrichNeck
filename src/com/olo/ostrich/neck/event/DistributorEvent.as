package com.olo.ostrich.neck.event
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class DistributorEvent extends Event
	{
		static public const FETCH_ALL_DISTRIBUTORS:String = "fetchAllDistributors";
		static public const UPDATE_DISTRIBUTORS:String = "updateDistributors";
		static public const SAVE_DISTRIBUTORS:String = "saveDistributors";
		static public const REMOVE_DISTRIBUTORS:String = "removeDistributors";
		
		public var distributorObjs:ArrayCollection = null;
		
		public function get locID():Number {
			return ConfigUtilitiesEvent.LOC_ID;
		}
		
		public function DistributorEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}