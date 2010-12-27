package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.MachineCleaning;
	import com.olo.ostrich.neck.event.MachineEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditMachineCleaningNotesPane;
	
	import flash.events.Event;

	public class EditMachineCleaningNotesCommand implements IEditCommand, IWizardUser
	{
		private var _machineCleaning:MachineCleaning = null;
		private var _machineCleaningClone:MachineCleaning = null;
		private var _wizard:WizardWindow = null;
		
		
		public function EditMachineCleaningNotesCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is MachineEvent)
			{
				_machineCleaning = MachineEvent(event).eventList[0];
				_machineCleaningClone = _machineCleaning.clone();
				
				if (_machineCleaning != null)
				{
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_MACHINE_CLEANING_NOTES_WIZARD_TYPE);
					_wizard.setPaneDataProvider(EditMachineCleaningNotesPane.PANE_NAME, _machineCleaningClone);
				}
			}
		}
		
		public function wizardComplete():void
		{
			_machineCleaningClone.clone(_machineCleaning);
			
			var saveEvent:MachineEvent = new MachineEvent(MachineEvent.SAVE_CLEANING_NOTES);
			saveEvent.machineCleaning = _machineCleaning;
			
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}