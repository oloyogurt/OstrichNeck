package com.olo.ostrich.neck.event
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class NewsEvent extends Event
	{
		static public const FETCH_ALL_BLOCK_NEWS:String = "fetchAllBlockNews";
		static public const FETCH_ACTIVE_BLOCK_NEWS:String = "fetchActiveBlockNews";
		static public const EDIT_BLOCK_NEWS:String = "editBlockNews";
		static public const REMOVE_BLOCK_NEWS:String = "removeBlockNews";
		static public const SAVE_BLOCK_NEWS:String = "saveBlockNews";
		static public const FETCH_ALL_SUMMARY_NEWS:String = "fetchAllSummaryNews";
		static public const FETCH_ACTIVE_SUMMARY_NEWS:String = "fetchActiveSummaryNews";
		static public const EDIT_SUMMARY_NEWS:String = "editSummaryNews";
		static public const REMOVE_SUMMARY_NEWS:String = "removeSummaryNews";
		static public const SAVE_SUMMARY_NEWS:String = "saveSummaryNews";
		
		public var blockNews:ArrayCollection = null;
		public var summaryNews:ArrayCollection = null;
		
		public function get locID():Number {
			return ConfigUtilitiesEvent.LOC_ID;
		}
		
		public function NewsEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}