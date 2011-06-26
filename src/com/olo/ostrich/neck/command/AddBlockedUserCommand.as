package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.event.ConfigUtilitiesEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.AddBlockedUserPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class AddBlockedUserCommand implements IEditCommand, IWizardUser
	{
		private var _blockedUsers:ArrayCollection = null;
		private var _wizard:WizardWindow = null;
		
		
		public function AddBlockedUserCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is ConfigUtilitiesEvent)
			{
				_blockedUsers = new ArrayCollection();
				
				_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.ADD_BLOCKED_USERS_TYPE);
				_wizard.setPaneDataProvider(AddBlockedUserPane.PANE_NAME, _blockedUsers);
			}
		}
		
		public function wizardComplete():void
		{
			var saveEvent:ConfigUtilitiesEvent = new ConfigUtilitiesEvent(ConfigUtilitiesEvent.SAVE_BLOCKED_USERS);
			saveEvent.users = _blockedUsers;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}