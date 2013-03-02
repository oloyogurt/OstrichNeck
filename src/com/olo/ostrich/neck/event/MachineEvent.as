package com.olo.ostrich.neck.event
{
	import com.olo.ostrich.neck.dto.Machine;
	import com.olo.ostrich.neck.dto.MachineCleaning;
	import com.olo.ostrich.neck.dto.MachineMaintenance;
	import com.olo.ostrich.neck.model.MachineInventoryModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class MachineEvent extends Event
	{
		static public const FETCH_ALL_MACHINES:String = "fetchAllMachines";
		static public const EDIT_MACHINE_DETAILS:String = "editMachineDetails";
		static public const SAVE_MACHINE_DETAILS:String = "saveMachineDetails";
		static public const FETCH_ALL_ACTIVE_MACHINE_INVENTORIES:String = "fetchAllActiveMachineInventories";
		static public const EDIT_MACHINE_INVENTORY:String = "editMachineInventory";
		static public const EDIT_MACHINE_INVENTORY_BULK:String = "editMachineInventoryBulk";
		static public const NEW_MACHINE_FLAVOR:String = "newMachineFlavor";
		static public const NEW_MACHINE_FLAVOR_SIMPLE:String = "newMachineFlavorSimple";
		static public const SAVE_MACHINE_INVENTORY:String = "saveMachineInventory";
		static public const SAVE_MACHINE_INVENTORY_BULK:String = "saveMachineInventoryBulk";
		static public const SAVE_MACHINE_FLAVOR:String = "saveMachineFlavor";
		static public const FETCH_SCOREBOARD_DATA:String = "fetchScoreboardData";
		static public const UPDATE_TRENDING_DATA:String = "updateTrendingData";
		static public const FETCH_MAINTENACE:String = "fetchMaintenace";
		static public const UPDATE_MAINTENANCE:String = "updateMaintenance";
		static public const SAVE_MAINTENANCE:String = "saveMaintenance";
		static public const REMOVE_MAINTENANCE:String = "removeMaintenance";
		static public const FETCH_FLAVOR_CHART_DATA:String = "fetchFlavorChartData";
		static public const CHANGE_CLEANING:String = "changeCleaning";
		static public const SAVE_CLEANING_CHANGE:String = "saveCleaningChange";
		static public const FETCH_CLEANING_NOTES:String = "fetchCleaningNotes";
		static public const UPDATE_CLEANING_NOTES:String = "updateCleaningNotes";
		static public const SAVE_CLEANING_NOTES:String = "saveCleaningNotes";
		static public const REMOVE_CLEANING_NOTES:String = "removeCleaningNotes";
		
		public var eventList:ArrayCollection = null;
		public var machine:Machine = null;
		public var machineNumber:int = -1;
		public var inventoryModel:MachineInventoryModel = null;
		public var machineMaintenance:MachineMaintenance = null;
		public var machineCleaning:MachineCleaning = null;
		
		public function get locID():Number {
			return ConfigUtilitiesEvent.LOC_ID;
		}
		
		
		public function MachineEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}