package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.Machine;
	import com.olo.ostrich.neck.event.MachineEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditMachineDetailsPane;
	
	import flash.events.Event;

	public class EditMachineDetailsCommand implements IEditCommand, IWizardUser
	{
		private var _machine:Machine = null;
		private var _machineClone:Machine = null;
		private var _wizard:WizardWindow = null;
		
		
		public function EditMachineDetailsCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is MachineEvent)
			{
				var machineEvent:MachineEvent = MachineEvent(event);
				if (machineEvent.machine != null)
				{
					_machine = machineEvent.machine;
					_machineClone = _machine.clone();
					
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_MACHINE_DETAILS_WIZARD_TYPE);
					_wizard.setPaneDataProvider(EditMachineDetailsPane.PANE_NAME, _machineClone);
				}
			}
		}
		
		public function wizardComplete():void
		{
			_machineClone.clone(_machine);
			
			var saveEvent:MachineEvent = new MachineEvent(MachineEvent.SAVE_MACHINE_DETAILS);
			saveEvent.machine = _machine;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		
		public function wizardCancel():void
		{
		}
		
	}
}