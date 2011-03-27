package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.InventoryItemDate;
	import com.olo.ostrich.neck.event.InventoryEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditInventoryItemDatePane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class EditInventoryItemDateCommand implements IEditCommand, IWizardUser
	{
		private var _model:InventoryItemDate = null;
		private var _modelClone:InventoryItemDate = null;
		private var _wizard:WizardWindow = null;
		
		
		public function EditInventoryItemDateCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is InventoryEvent)
			{
				_model = InventoryItemDate(InventoryEvent(event).inventoryObjs[0]);
				_modelClone = _model.clone();
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_INVENTORY_ITEM_DATE_WIZARD_TYPE);
				_wizard.setPaneDataProvider(EditInventoryItemDatePane.PANE_NAME, _modelClone);
			}
		}
		
		public function wizardComplete():void
		{
			_modelClone.clone(_model);
			
			var saveEvent:InventoryEvent = new InventoryEvent(InventoryEvent.SAVE_INVENTORY_DATES);
			saveEvent.inventoryObjs = new ArrayCollection([_model]);
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}