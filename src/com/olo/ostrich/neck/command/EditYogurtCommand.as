package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.Yogurt;
	import com.olo.ostrich.neck.event.YogurtEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditYogurtPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;


	public class EditYogurtCommand implements IEditCommand, IWizardUser
	{
		private var _yogurt:Yogurt = null;
		private var _yogurtClone:Yogurt = null;
		private var _wizard:WizardWindow = null;
		
		
		public function EditYogurtCommand()
		{
		}


		public function execute(event:Event):void
		{
			if (event is YogurtEvent)
			{
				_yogurt = YogurtEvent(event).yogurts[0];
				_yogurtClone = _yogurt.clone();
				
				if (_yogurt != null)
				{
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_YOGURT_WIZARD_TYPE);
					_wizard.setPaneDataProvider(EditYogurtPane.PANE_NAME, _yogurtClone);
				}
			}
		}
		
		
		public function wizardComplete():void
		{
			_yogurtClone.clone(_yogurt);
			
			var saveEvent:YogurtEvent = new YogurtEvent(YogurtEvent.SAVE_YOGURT);
			saveEvent.yogurts = new ArrayCollection([_yogurt]);
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		
		public function wizardCancel():void
		{
		}
		
	}
}