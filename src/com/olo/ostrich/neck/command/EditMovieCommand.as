package com.olo.ostrich.neck.command
{
	import com.asfusion.mate.events.Dispatcher;
	import com.olo.ostrich.neck.dto.VideoInfo;
	import com.olo.ostrich.neck.event.ConfigUtilitiesEvent;
	import com.olo.ostrich.neck.wizard.IWizardUser;
	import com.olo.ostrich.neck.wizard.WizardFactory;
	import com.olo.ostrich.neck.wizard.WizardWindow;
	import com.olo.ostrich.neck.wizard.pane.EditMoviePane;
	
	import flash.events.Event;

	public class EditMovieCommand implements IEditCommand, IWizardUser
	{
		private var _model:VideoInfo = null;
		private var _modelClone:VideoInfo = null;
		private var _wizard:WizardWindow = null;
		
		
		public function EditMovieCommand()
		{
		}

		public function execute(event:Event):void
		{
			if (event is ConfigUtilitiesEvent)
			{
				_model = ConfigUtilitiesEvent(event).videoInfo;
				if (_model)
				{
					_modelClone = _model.clone();
					
					_wizard = WizardFactory.getInstance().activateNewWizard(this, WizardFactory.EDIT_MOVIE_WIZARD_TYPE);
					_wizard.setPaneDataProvider(EditMoviePane.PANE_NAME, _modelClone);
				}
			}
		}
		
		public function wizardComplete():void
		{
			_modelClone.clone(_model);
			
			var saveEvent:ConfigUtilitiesEvent = new ConfigUtilitiesEvent(ConfigUtilitiesEvent.SAVE_VIDEO_INFO);
			saveEvent.videoInfo = _model;
			(new Dispatcher).dispatchEvent(saveEvent);
		}
		
		public function wizardCancel():void
		{
		}
		
	}
}