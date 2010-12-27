package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.SummaryNews;
	import com.olo.ostrich.neck.event.NewsEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditSummaryNewsPane;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class EditSummaryNewsCommand implements IEditCommand, IWizardUser
	{
		private var _summaryNews:SummaryNews = null;
		private var _summaryNewsClone:SummaryNews = null;
		private var _wizard:WizardWindow = null;
				
		
		public function EditSummaryNewsCommand()
		{
		}


		public function execute(event:Event):void
		{
			if (event is NewsEvent)
			{
				_summaryNews = NewsEvent(event).summaryNews[0];
				_summaryNewsClone = _summaryNews.clone();
				
				if (_summaryNews != null)
				{
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_SUMMARY_NEWS_WIZARD_TYPE);
					_wizard.setPaneDataProvider(EditSummaryNewsPane.PANE_NAME, _summaryNewsClone);
				}
			}
		}

		
		public function wizardComplete():void
		{
			_summaryNewsClone.clone(_summaryNews);
			
			var saveEvent:NewsEvent = new NewsEvent(NewsEvent.SAVE_SUMMARY_NEWS);
			saveEvent.summaryNews = new ArrayCollection([_summaryNews]);
			(new Dispatcher).dispatchEvent(saveEvent);
		}

		
		public function wizardCancel():void
		{
		}
		
	}
}