package com.olo.ostrich.neck.event
{
	import flash.events.Event;

	public class CloudEvent extends Event
	{
		static public const FETCH_CURRENT_FLAVORS:String = "fetchCurrentFlavors";
		static public const FETCH_VOTING_STATS:String = "fetchVotingStats"; 
		
		public function CloudEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}