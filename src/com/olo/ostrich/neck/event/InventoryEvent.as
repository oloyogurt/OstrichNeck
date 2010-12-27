package com.olo.ostrich.neck.event
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class InventoryEvent extends Event
	{
		static public const FETCH_ALL_INVENTORY_VESSELS:String = "fetchAllInventoryVessels";
		static public const UPDATE_INVENTORY_VESSELS:String = "updateInventoryVessels";
		static public const SAVE_INVENTORY_VESSELS:String = "saveInventoryVessels";
		static public const REMOVE_INVENTORY_VESSELS:String = "removeInventoryVessels";
		static public const FETCH_ALL_INVENTORY_ITEMS:String = "fetchAllInventoryItems";
		static public const UPDATE_INVENTORY_ITEMS:String = "updateInventoryItems";
		static public const SAVE_INVENTORY_ITEMS:String = "saveInventoryItems";
		static public const REMOVE_INVENTORY_ITEMS:String = "removeInventoryItems";
		
		public var inventoryObjs:ArrayCollection = null;
		public var distributors:ArrayCollection = null;
		public var containers:ArrayCollection = null;
		
		public function InventoryEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}