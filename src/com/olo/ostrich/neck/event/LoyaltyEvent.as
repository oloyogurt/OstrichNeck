package com.olo.ostrich.neck.event
{
	import flash.events.Event;

	public class LoyaltyEvent extends Event
	{
		static public const FETCH_LOYALTY_SUMMARY:String = "fetchLoyaltySummary";
		
		public function get locID():Number {
			return ConfigUtilitiesEvent.LOC_ID;
		}
		
		public function LoyaltyEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}