package com.olo.ostrich.neck.event
{
	import com.olo.ostrich.neck.dto.Distributor;
	import com.olo.ostrich.neck.dto.InventoryItem;
	import com.olo.ostrich.neck.dto.InventoryOrder;
	
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
		static public const FETCH_INVENTORY_DATE_ITEMS:String = "fetchInventoryDateItems";
		static public const UPDATE_INVENTORY_DATES:String = "updateInventoryDates";
		static public const SAVE_INVENTORY_DATES:String = "saveInventoryDates";
		static public const REMOVE_INVENTORY_DATES:String = "removeInventoryDates";
		static public const FETCH_LOW_CONTAINERS:String = "fetchLowContainers";
		static public const FETCH_OLD_INVENTORY_ITEMS:String = "fetchOldInventoryItems";
		static public const FETCH_NEW_ORDERS:String = "fetchNewOrders";
		static public const FETCH_NEW_ORDER_ITEMS:String = "fetchNewOrderItems";
		static public const FETCH_PREVIOUS_ORDERS:String = "fetchPreviousOrders";
		static public const FETCH_PREVIOUS_ORDER_ITEMS:String = "fetchPreviousOrderItems";
		static public const CREATE_NEW_ORDER_COMMAND:String = "createNewOrderCommand";
		static public const CREATE_NEW_ORDER:String = "createNewOrder";
		static public const REMOVE_PENDING_ORDER:String = "removePendingOrder";
		static public const MODIFY_ORDER:String = "modifyOrder";
		static public const SAVE_MODIFIED_ORDER:String = "saveModifiedOrder";
		static public const REACTIVATE_ORDERS:String = "reactivateOrders";
		static public const ACCEPT_ORDERS:String = "acceptOrders";
		static public const EDIT_INVENTORY_COUNTS:String = "editInventoryCounts";
		static public const SAVE_INVENTORY_COUNTS:String = "saveInventoryCounts";
		static public const FETCH_INVENTORY_TOTALS:String = "fetchInventoryTotals";
		static public const FETCH_TRANSIENT_INVENTORIES:String = "fetchTransientInventories";
		
		public var inventoryObjs:ArrayCollection = null;
		public var distributors:ArrayCollection = null;
		public var containers:ArrayCollection = null;
		public var orders:ArrayCollection = null;
		public var orderItems:ArrayCollection = null;
		public var inventoryItem:InventoryItem = null;
		public var distributor:Distributor = null;
		public var order:InventoryOrder = null;
		public var containerId:Number = -1;
		
		public function InventoryEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}