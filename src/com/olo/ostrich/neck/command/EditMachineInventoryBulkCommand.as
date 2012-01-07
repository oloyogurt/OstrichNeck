package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.event.MachineEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditMachineInventoryBulkPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class EditMachineInventoryBulkCommand implements IEditCommand, IWizardUser
	{
		private var _wizard:WizardWindow = null;
		
		
		public function EditMachineInventoryBulkCommand()
		{
		}

		public function execute(event:Event):void
		{
			_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_MACHINE_INVENTORY_BULK_WIZARD_TYPE);
			_wizard.setPaneDataProvider(EditMachineInventoryBulkPane.PANE_NAME, null);
		}
		
		public function wizardComplete():void
		{
			var modelList:ArrayCollection = ArrayCollection(_wizard.getPaneDataProvider(EditMachineInventoryBulkPane.PANE_NAME));
			var saveEvent:MachineEvent = new MachineEvent(MachineEvent.SAVE_MACHINE_INVENTORY_BULK);
			saveEvent.eventList = modelList;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}