package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.Distributor;
	import com.olo.ostrich.neck.event.InventoryEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.SelectDistributorPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class CreateNewOrderCommand implements IEditCommand, IWizardUser
	{
		private var _model:Distributor = null;
		private var _modelClone:Distributor = null;
		private var _wizard:WizardWindow = null;
		
		private var _distributors:ArrayCollection = null;
		
		
		public function CreateNewOrderCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is InventoryEvent)
			{
				_model = InventoryEvent(event).distributor;
				if (_model) _modelClone = _model.clone();
				_distributors = InventoryEvent(event).distributors;
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.CREATE_NEW_ORDER_WIZARD_TYPE);
				_wizard.setPaneDataProvider(SelectDistributorPane.PANE_NAME, _modelClone);
				_wizard.setPaneAuxProvider(SelectDistributorPane.PANE_NAME, _distributors);
			}
		}
		
		public function wizardComplete():void
		{
			_modelClone = Distributor(_wizard.getPaneDataProvider(SelectDistributorPane.PANE_NAME));
			_model = _modelClone.clone(_model);
			
			var e:InventoryEvent = new InventoryEvent(InventoryEvent.CREATE_NEW_ORDER);
			e.distributor = _model;
			(new Dispatcher).dispatchEvent(e);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}