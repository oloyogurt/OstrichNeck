package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.InventoryItem;
	import com.olo.ostrich.neck.event.InventoryEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditInventoryPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class EditInventoryCommand implements IEditCommand, IWizardUser
	{
		private var _model:InventoryItem = null;
		private var _modelClone:InventoryItem = null;
		private var _wizard:WizardWindow = null;
		
		private var _distributors:ArrayCollection = null;
		
		
		public function EditInventoryCommand()
		{
		}
		

		public function execute(event:Event):void
		{
			if (event is InventoryEvent)
			{
				_model = InventoryItem(InventoryEvent(event).inventoryObjs[0]);
				_modelClone = _model.clone();
				_distributors = InventoryEvent(event).distributors;
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_INVENTORY_WIZARD_TYPE);
				_wizard.setPaneDataProvider(EditInventoryPane.PANE_NAME, _modelClone);
				_wizard.setPaneAux1Provider(EditInventoryPane.PANE_NAME, _distributors);
			}
		}
		
		public function wizardComplete():void
		{
			_modelClone.clone(_model);
			
			var saveEvent:InventoryEvent = new InventoryEvent(InventoryEvent.SAVE_INVENTORY_ITEMS);
			saveEvent.inventoryObjs = new ArrayCollection([_model]);
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}