package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.event.ConfigUtilitiesEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.AddHashReferencePane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class AddHashReferencesCommand implements IEditCommand, IWizardUser
	{
		private var _hashReferences:ArrayCollection = null;
		private var _wizard:WizardWindow = null;
		
		
		public function AddHashReferencesCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is ConfigUtilitiesEvent)
			{
				_hashReferences = new ArrayCollection();
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.ADD_HASH_REFERENCES_TYPE);
				_wizard.setPaneDataProvider(AddHashReferencePane.PANE_NAME, _hashReferences);
			}
		}
		
		public function wizardComplete():void
		{
			var saveEvent:ConfigUtilitiesEvent = new ConfigUtilitiesEvent(ConfigUtilitiesEvent.SAVE_HASH_REF);
			saveEvent.hashReferences = _hashReferences;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}