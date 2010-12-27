package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.event.ConfigUtilitiesEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.AddDirtyWordsPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class AddDirtyWordsCommand implements IEditCommand, IWizardUser
	{
		private var _dirties:ArrayCollection = null;
		private var _wizard:WizardWindow = null;
		
		
		public function AddDirtyWordsCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is ConfigUtilitiesEvent)
			{
				_dirties = new ArrayCollection();
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.ADD_DIRTY_WORDS_TYPE);
				_wizard.setPaneDataProvider(AddDirtyWordsPane.PANE_NAME, _dirties);
			}
		}
		
		public function wizardComplete():void
		{
			var saveEvent:ConfigUtilitiesEvent = new ConfigUtilitiesEvent(ConfigUtilitiesEvent.SAVE_DIRTY_WORDS);
			saveEvent.dirtyWords = _dirties;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}