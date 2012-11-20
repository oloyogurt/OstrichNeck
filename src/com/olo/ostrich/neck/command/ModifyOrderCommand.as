package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.InventoryOrder;
	import com.olo.ostrich.neck.dto.InventoryOrderItem;
	import com.olo.ostrich.neck.event.InventoryEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.ModifyOrderPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class ModifyOrderCommand implements IEditCommand, IWizardUser
	{
		private var _order:InventoryOrder = null;
		private var _orderClone:InventoryOrder = null;
		private var _wizard:WizardWindow = null;
		
		private var _orderItems:ArrayCollection = null;
		
		
		public function ModifyOrderCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is InventoryEvent)
			{
				_order = InventoryEvent(event).order;
				_orderClone = _order.clone();
				_orderItems = InventoryEvent(event).orderItems;
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.MODIFY_ORDER_TYPE);
				_wizard.setPaneDataProvider(ModifyOrderPane.PANE_NAME, _orderClone);
				_wizard.setPaneAux1Provider(ModifyOrderPane.PANE_NAME, _orderItems);
			}
		}
		
		public function wizardComplete():void
		{
			_orderClone.clone(_order);
			
			var saveEvent:InventoryEvent = new InventoryEvent(InventoryEvent.SAVE_MODIFIED_ORDER);
			saveEvent.order = _order;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}