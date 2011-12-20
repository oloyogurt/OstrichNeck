package com.olo.ostrich.neck.wizard
{
	import com.olo.ostrich.neck.wizard.pane.AddBlockedUserPane;
	import com.olo.ostrich.neck.wizard.pane.AddDirtyWordsPane;
	import com.olo.ostrich.neck.wizard.pane.AddHashReferencePane;
	import com.olo.ostrich.neck.wizard.pane.ChangeMachineCleaningPane;
	import com.olo.ostrich.neck.wizard.pane.ChangeMachineFlavorPane;
	import com.olo.ostrich.neck.wizard.pane.ChangeVoteFlavorsPane;
	import com.olo.ostrich.neck.wizard.pane.EditBlockNewsPane;
	import com.olo.ostrich.neck.wizard.pane.EditEggConfigPane;
	import com.olo.ostrich.neck.wizard.pane.EditInventoryItemDatePane;
	import com.olo.ostrich.neck.wizard.pane.EditInventoryPane;
	import com.olo.ostrich.neck.wizard.pane.EditMachineCleaningNotesPane;
	import com.olo.ostrich.neck.wizard.pane.EditMachineDetailsPane;
	import com.olo.ostrich.neck.wizard.pane.EditMachineInventoryPane;
	import com.olo.ostrich.neck.wizard.pane.EditMachineMaintenancePane;
	import com.olo.ostrich.neck.wizard.pane.EditMoviePane;
	import com.olo.ostrich.neck.wizard.pane.EditSummaryNewsPane;
	import com.olo.ostrich.neck.wizard.pane.EditYogurtPane;
	import com.olo.ostrich.neck.wizard.pane.InventoryCountsPane;
	import com.olo.ostrich.neck.wizard.pane.ModifyOrderPane;
	import com.olo.ostrich.neck.wizard.pane.SelectDistributorPane;
	import com.olo.ostrich.neck.wizard.pane.UpdateDistributorPane;
	
	import flash.display.DisplayObject;
	
	import mx.collections.ArrayCollection;
	import mx.core.Application;
	import mx.managers.PopUpManager;
	
	public class WizardFactory
	{
		static public const EDIT_YOGURT_WIZARD_TYPE:String = "editYogurtWizard";
		static public const EDIT_MACHINE_INVENTORY_WIZARD_TYPE:String = "editMachineInventoryWizard";
		static public const EDIT_MACHINE_DETAILS_WIZARD_TYPE:String = "editMachineDetailsWizard";
		static public const CHANGE_MACHINE_FLAVOR_DETAILS_WIZARD_TYPE:String = "changeMachineFlavorDetailsWizard";
		static public const EDIT_BLOCK_NEWS_WIZARD_TYPE:String = "editBlockNewsWizard";
		static public const EDIT_SUMMARY_NEWS_WIZARD_TYPE:String = "editSummaryNewsWizard";
		static public const ADD_DIRTY_WORDS_TYPE:String = "addDirtyWords";
		static public const ADD_HASH_REFERENCES_TYPE:String = "addHashReferences";
		static public const EDIT_MACHINE_MAINTENANCE_TYPE:String = "editMachineMaintenance";
		static public const CHANGE_MACHINE_CLEANING_WIZARD_TYPE:String = "changeMachineCleaning";
		static public const EDIT_MACHINE_CLEANING_NOTES_WIZARD_TYPE:String = "editMachineCleaningNotesWizard";
		static public const UPDATE_INVENTORY_VESSELS_WIZARD_TYPE:String = "updateInventoryVesselsWizardtype";
		static public const UPDATE_DISTRIBUTOR_WIZARD_TYPE:String = "updateDistributorWizardType";
		static public const EDIT_EGG_CONFIG_WIZARD_TYPE:String = "editEggConfigWizardType";
		static public const EDIT_MOVIE_WIZARD_TYPE:String = "editMovieWizardType";
		static public const EDIT_INVENTORY_WIZARD_TYPE:String = "editInventoryWizardType";
		static public const CREATE_NEW_ORDER_WIZARD_TYPE:String = "createNewOrderWizardType";
		static public const MODIFY_ORDER_TYPE:String = "modifyOrderType";
		static public const INVENTORY_COUTS:String = "inventoryCounts";
		static public const ADD_BLOCKED_USERS_TYPE:String = "addBlockedUsersType";
		static public const CHANGE_VOTE_FLAVORS_TYPE:String = "changeVoteFlavorsType";
		
		
		static private var _instance:WizardFactory = null;
		
		
		static public function getInstance():WizardFactory
		{
			if (_instance == null) _instance = new WizardFactory();
			return _instance;
		}
		
		
		public function WizardFactory()
		{
		}


		public function activateNewWizard(wizardUser:IWizardUser, type:String):WizardWindow
		{
			var wizard:WizardWindow = WizardWindow(PopUpManager.createPopUp(DisplayObject(Application.application), WizardWindow, true));
			wizard.wizardUser = wizardUser;
			setWizardProperties(type, wizard);
			PopUpManager.centerPopUp(wizard);
			return wizard;
		}
		
		
		private function setWizardProperties(wizardType:String, wizard:WizardWindow):void
		{
			var panes:Array;
			var title:String;
			
			if (wizardType == EDIT_YOGURT_WIZARD_TYPE)
			{
				panes = [new EditYogurtPane()];
				title = "Edit Yogurt";
			}
			else if (wizardType == EDIT_MACHINE_INVENTORY_WIZARD_TYPE)
			{
				panes = [new EditMachineInventoryPane()];
				title = "Edit Machine Inventory";
			}
			else if (wizardType == EDIT_MACHINE_DETAILS_WIZARD_TYPE)
			{
				panes = [new EditMachineDetailsPane()];
				title = "Edit Machine Details";
			}
			else if (wizardType == CHANGE_MACHINE_FLAVOR_DETAILS_WIZARD_TYPE)
			{
				panes = [new ChangeMachineFlavorPane()];
				title = "Change Machine Flavor";
			}
			else if (wizardType == EDIT_BLOCK_NEWS_WIZARD_TYPE)
			{
				panes = [new EditBlockNewsPane()];
				title = "Edit Block News";
			}
			else if (wizardType == EDIT_SUMMARY_NEWS_WIZARD_TYPE)
			{
				panes = [new EditSummaryNewsPane()];
				title = "Edit Summary News";
			}
			else if (wizardType == ADD_DIRTY_WORDS_TYPE)
			{
				panes = [new AddDirtyWordsPane()];
				title = "Add Dirty Words";
			}
			else if (wizardType == ADD_HASH_REFERENCES_TYPE)
			{
				panes = [new AddHashReferencePane()];
				title = "Add Hash References";
			}
			else if (wizardType == EDIT_MACHINE_MAINTENANCE_TYPE)
			{
				panes = [new EditMachineMaintenancePane()];
				title = "Edit Machine Maintenance";
			}
			else if (wizardType == CHANGE_MACHINE_CLEANING_WIZARD_TYPE)
			{
				panes = [new ChangeMachineCleaningPane()];
				title = "Change Machine Cleaning Schedule";
			}
			else if (wizardType == EDIT_MACHINE_CLEANING_NOTES_WIZARD_TYPE)
			{
				panes = [new EditMachineCleaningNotesPane()];
				title = "Edit Machine Cleaning Notes";
			}
			else if (wizardType == UPDATE_DISTRIBUTOR_WIZARD_TYPE)
			{
				panes = [new UpdateDistributorPane()];
				title = "Update Distributor";
			}
			else if (wizardType == EDIT_EGG_CONFIG_WIZARD_TYPE)
			{
				panes = [new EditEggConfigPane()];
				title = "Edit Ostrich Egg Config";
			}
			else if (wizardType == EDIT_MOVIE_WIZARD_TYPE)
			{
				panes = [new EditMoviePane()];
				title = "Edit Video Properties";
			}
			else if (wizardType == EDIT_INVENTORY_WIZARD_TYPE)
			{
				panes = [new EditInventoryPane()];
				title = "Edit Inventory";
			}
			else if (wizardType == CREATE_NEW_ORDER_WIZARD_TYPE)
			{
				panes = [new SelectDistributorPane()];
				title = "Create A New Order";
			}
			else if (wizardType == MODIFY_ORDER_TYPE)
			{
				panes = [new ModifyOrderPane()];
				title = "Modify The Order";
			}
			else if (wizardType == INVENTORY_COUTS)
			{
				panes = [new InventoryCountsPane()];
				title = "Inventory Counts";
			}
			else if (wizardType == ADD_BLOCKED_USERS_TYPE)
			{
				panes = [new AddBlockedUserPane()];
				title = "Add Blocked Users";
			}
			else if (wizardType == CHANGE_VOTE_FLAVORS_TYPE)
			{
				panes = [new ChangeVoteFlavorsPane()];
				title = "Change Vote Flavors";
			}
			
			wizard.wizardPanes = new ArrayCollection(panes);
			wizard.title = title;
		}
	}
}