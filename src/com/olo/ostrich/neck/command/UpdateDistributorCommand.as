package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.command.IEditCommand;
	import com.olo.ostrich.neck.dto.Distributor;
	import com.olo.ostrich.neck.event.DistributorEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.UpdateDistributorPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class UpdateDistributorCommand implements IEditCommand, IWizardUser
	{
		private var _distributor:Distributor = null;
		private var _distributorClone:Distributor = null;
		private var _wizard:WizardWindow = null;
		
		
		public function UpdateDistributorCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is DistributorEvent)
			{
				_distributor = DistributorEvent(event).distributorObjs[0];
				_distributorClone = _distributor.clone();
				
				if (_distributor != null)
				{
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.UPDATE_DISTRIBUTOR_WIZARD_TYPE);
					_wizard.setPaneDataProvider(UpdateDistributorPane.PANE_NAME, _distributorClone);
				}
			}
		}
		
		public function wizardComplete():void
		{
			_distributorClone.clone(_distributor);
			
			var saveEvent:DistributorEvent = new DistributorEvent(DistributorEvent.SAVE_DISTRIBUTORS);
			saveEvent.distributorObjs = new ArrayCollection([_distributor]);
			
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}