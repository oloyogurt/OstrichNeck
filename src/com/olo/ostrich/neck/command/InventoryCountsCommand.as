package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.InventoryItem;
	import com.olo.ostrich.neck.event.InventoryEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.InventoryCountsPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.formatters.NumberFormatter;

	public class InventoryCountsCommand implements IEditCommand, IWizardUser
	{
		private var _numFormat:NumberFormatter = new NumberFormatter(); 
		private var _inventoryObs:ArrayCollection = null;
		private var _clonedInventoryObs:ArrayCollection = null;
		private var _wizard:WizardWindow = null;
		
		
		public function InventoryCountsCommand()
		{
			_numFormat.precision = 2;
		}

		public function execute(event:Event):void
		{
			if (event is InventoryEvent)
			{
				_inventoryObs = InventoryEvent(event).inventoryObjs;
				if (_inventoryObs != null)
				{
					// Clone inventory items so that the counts can be edited
					_clonedInventoryObs = new ArrayCollection();
					for each (var item:InventoryItem in _inventoryObs)
					{
						var clone:InventoryItem = item.clone();
						
						// Calculate out case counts (Not for yogurt since we always unbox)
						if (clone.category != InventoryItem.INVENTORY_CATEGORY_FOOD_YOGURT)
						{
							if (item.itemsInCase > 1)
							{
								clone.boxCount = Math.floor(item.currentQuantity / item.itemsInCase);
								clone.currentQuantity = item.currentQuantity % item.itemsInCase;
							}
						}
						
						_clonedInventoryObs.addItem(clone);
					}
				
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.INVENTORY_COUTS);
					_wizard.setPaneDataProvider(InventoryCountsPane.PANE_NAME, _clonedInventoryObs);
				}
			}
		}
		
		public function wizardComplete():void
		{
			// Convert case counts back down to individuals and force
			//   max 2 precision in count
			for each (var clone:InventoryItem in _clonedInventoryObs)
			{
				clone.currentQuantity += clone.boxCount * clone.itemsInCase;
				clone.currentQuantity = Number(_numFormat.format(clone.currentQuantity));
				clone.boxCount = 0;
			}
			
			var saveEvent:InventoryEvent = new InventoryEvent(InventoryEvent.SAVE_INVENTORY_COUNTS);
			saveEvent.inventoryObjs = _clonedInventoryObs;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}