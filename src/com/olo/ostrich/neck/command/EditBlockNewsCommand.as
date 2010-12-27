package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.BlockNews;
	import com.olo.ostrich.neck.event.NewsEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditBlockNewsPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class EditBlockNewsCommand implements IEditCommand, IWizardUser
	{
		private var _blockNews:BlockNews = null;
		private var _blockNewsClone:BlockNews = null;
		private var _wizard:WizardWindow = null;
		
		
		public function EditBlockNewsCommand()
		{
		}


		public function execute(event:Event):void
		{
			if (event is NewsEvent)
			{
				_blockNews = NewsEvent(event).blockNews[0];
				_blockNewsClone = _blockNews.clone();
				
				if (_blockNews != null)
				{
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_BLOCK_NEWS_WIZARD_TYPE);
					_wizard.setPaneDataProvider(EditBlockNewsPane.PANE_NAME, _blockNewsClone);
				}
			}
		}

		
		public function wizardComplete():void
		{
			_blockNewsClone.clone(_blockNews);
			
			var saveEvent:NewsEvent = new NewsEvent(NewsEvent.SAVE_BLOCK_NEWS);
			saveEvent.blockNews = new ArrayCollection([_blockNews]);
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		
		public function wizardCancel():void
		{
		}
		
	}
}