package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.Machine;
	import com.olo.ostrich.neck.event.MachineEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.ChangeMachineCleaningPane;
	
	import flash.events.Event;

	public class ChangeCleaningCommand implements IEditCommand, IWizardUser
	{
		private var _model:Machine = null;
		private var _modelClone:Machine = null;
		private var _wizard:WizardWindow = null;
		
		
		public function ChangeCleaningCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is MachineEvent)
			{
				_model = MachineEvent(event).machine;
				_modelClone = _model.clone();
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.CHANGE_MACHINE_CLEANING_WIZARD_TYPE);
				_wizard.setPaneDataProvider(ChangeMachineCleaningPane.PANE_NAME, _modelClone);
			}
		}
		
		public function wizardComplete():void
		{
			_modelClone.clone(_model);
			
			var saveEvent:MachineEvent = new MachineEvent(MachineEvent.SAVE_CLEANING_CHANGE);
			saveEvent.machine = _model;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}