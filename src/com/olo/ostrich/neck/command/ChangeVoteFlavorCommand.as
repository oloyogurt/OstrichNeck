package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.event.CloudEvent;
	import com.olo.ostrich.neck.model.FlavorModel;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.ChangeVoteFlavorsPane;
	
	import flash.events.Event;

	public class ChangeVoteFlavorCommand implements IEditCommand, IWizardUser
	{
		private var _model:FlavorModel = null;
		private var _modelClone:FlavorModel = null;
		private var _wizard:WizardWindow = null;
		
		
		public function ChangeVoteFlavorCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is CloudEvent)
			{
				_model = CloudEvent(event).voteFlavors;
				if (_model)
				{
					_modelClone = _model.clone();
					
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.CHANGE_VOTE_FLAVORS_TYPE);
					_wizard.setPaneDataProvider(ChangeVoteFlavorsPane.PANE_NAME, _modelClone);
				}
			}
		}
		
		public function wizardComplete():void
		{
			_modelClone.clone(_model);
			
			var saveEvent:CloudEvent = new CloudEvent(CloudEvent.SAVE_VOTING_FLAVOR_NAMES);
			saveEvent.voteFlavors = _model;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}