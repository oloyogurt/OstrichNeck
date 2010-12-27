package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.InventoryStorageVessel;
	import com.olo.ostrich.neck.event.InventoryEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.UpdateInventoryVesselsPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class UpdateInventoryVesselsCommand implements IEditCommand, IWizardUser
	{
		private var _inventoryVessel:InventoryStorageVessel = null;
		private var _inventoryVesselClone:InventoryStorageVessel = null;
		private var _wizard:WizardWindow = null;
		
		
		public function UpdateInventoryVesselsCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is InventoryEvent)
			{
				_inventoryVessel = InventoryEvent(event).inventoryObjs[0];
				_inventoryVesselClone = _inventoryVessel.clone();
				
				if (_inventoryVessel != null)
				{
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.UPDATE_INVENTORY_VESSELS_WIZARD_TYPE);
					_wizard.setPaneDataProvider(UpdateInventoryVesselsPane.PANE_NAME, _inventoryVesselClone);
				}
			}
		}
		
		public function wizardComplete():void
		{
			_inventoryVesselClone.clone(_inventoryVessel);
			
			var saveEvent:InventoryEvent = new InventoryEvent(InventoryEvent.SAVE_INVENTORY_VESSELS);
			saveEvent.inventoryObjs = new ArrayCollection([_inventoryVessel]);
			
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}