package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.EggConfig;
	import com.olo.ostrich.neck.event.ConfigUtilitiesEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditEggConfigPane;
	
	import flash.events.Event;

	public class EditEggConfigCommand implements IEditCommand, IWizardUser
	{
		private var _model:EggConfig = null;
		private var _modelClone:EggConfig = null;
		private var _wizard:WizardWindow = null;
		
		
		public function EditEggConfigCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is ConfigUtilitiesEvent)
			{
				_model = ConfigUtilitiesEvent(event).eggConfig;
				if (_model)
				{
					_modelClone = _model.clone();
					
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_EGG_CONFIG_WIZARD_TYPE);
					_wizard.setPaneDataProvider(EditEggConfigPane.PANE_NAME, _modelClone);
				}
			}
		}
		
		
		public function wizardComplete():void
		{
			_modelClone.clone(_model);
		
			var saveEvent:ConfigUtilitiesEvent = new ConfigUtilitiesEvent(ConfigUtilitiesEvent.SAVE_EGG_CONFIG);	
			saveEvent.eggConfig = _model;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}