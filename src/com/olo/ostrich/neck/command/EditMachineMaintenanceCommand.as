package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.MachineMaintenance;
	import com.olo.ostrich.neck.event.MachineEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditMachineMaintenancePane;
	
	import flash.events.Event;


	public class EditMachineMaintenanceCommand implements IEditCommand, IWizardUser
	{
		private var _machineMaintenance:MachineMaintenance = null;
		private var _machineMaintenanceClone:MachineMaintenance = null;
		private var _wizard:WizardWindow = null;
		
		
		public function EditMachineMaintenanceCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is MachineEvent)
			{
				_machineMaintenance = MachineEvent(event).eventList[0];
				_machineMaintenanceClone = _machineMaintenance.clone();
				
				if (_machineMaintenance != null)
				{
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_MACHINE_MAINTENANCE_TYPE);
					_wizard.setPaneDataProvider(EditMachineMaintenancePane.PANE_NAME, _machineMaintenanceClone);
				}
			}
		}
		
		public function wizardComplete():void
		{
			_machineMaintenanceClone.clone(_machineMaintenance);
			
			var saveEvent:MachineEvent = new MachineEvent(MachineEvent.SAVE_MAINTENANCE);
			saveEvent.machineMaintenance = _machineMaintenance;
			
			(new Dispatcher).dispatchEvent(saveEvent); 
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}