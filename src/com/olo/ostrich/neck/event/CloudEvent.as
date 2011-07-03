package com.olo.ostrich.neck.event
{
	import com.olo.ostrich.neck.model.FlavorModel;
	
	import flash.events.Event;

	public class CloudEvent extends Event
	{
		static public const FETCH_CURRENT_FLAVORS:String = "fetchCurrentFlavors";
		static public const UPDATE_CURRENT_FLAVORS:String = "updateCurrentFlavors";
		static public const FETCH_VOTING_STATS:String = "fetchVotingStats"; 
		static public const CHANGE_VOTING_FLAVOR_NAMES:String = "changeVotingStats";
		static public const SAVE_VOTING_FLAVOR_NAMES:String = "saveVotingStats";
		
		public var voteFlavors:FlavorModel = null;
		
		public function CloudEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}