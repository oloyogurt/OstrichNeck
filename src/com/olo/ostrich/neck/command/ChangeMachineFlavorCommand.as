package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.event.MachineEvent;
	import com.olo.ostrich.neck.model.MachineInventoryModel;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.ChangeMachineFlavorPane;
	
	import flash.events.Event;

	public class ChangeMachineFlavorCommand implements IEditCommand, IWizardUser
	{
		private var _model:MachineInventoryModel = null;
		private var _modelClone:MachineInventoryModel = null;
		private var _wizard:WizardWindow = null;
		
		
		public function ChangeMachineFlavorCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is MachineEvent)
			{
				_model = MachineEvent(event).inventoryModel;
				_modelClone = _model.clone();
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.CHANGE_MACHINE_FLAVOR_DETAILS_WIZARD_TYPE);
				_wizard.setPaneDataProvider(ChangeMachineFlavorPane.PANE_NAME, _modelClone);
			}
		}
		
		public function wizardComplete():void
		{
			_modelClone.clone(_model);
			
			var saveEvent:MachineEvent = new MachineEvent(MachineEvent.SAVE_MACHINE_FLAVOR);
			saveEvent.inventoryModel = _model;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}