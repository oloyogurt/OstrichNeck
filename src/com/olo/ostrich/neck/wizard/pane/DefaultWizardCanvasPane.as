package com.olo.ostrich.neck.wizard.pane
{
	import mx.containers.Canvas;

	public class DefaultWizardCanvasPane extends Canvas implements IWizardPane
	{
		[Bindable] private var _title:String = "";
		[Bindable] private var _paneName:String = "";
		private var _isValid:Boolean = false;
		
		
		public function DefaultWizardCanvasPane()
		{
			super();
		}
		
		public function showPane():void
		{
		}
		
		public function hidePane():void
		{
		}
		
		[Bindable] public function get isValid():Boolean
		{
			return _isValid;
		}
		
		public function set isValid(value:Boolean):void
		{
			_isValid = value;
		}
		
		public function set paneName(name:String):void
		{
			_paneName = name;
		}
		
		public function get paneName():String
		{
			return _paneName;
		}
		
		public function set dataProvider(dp:Object):void
		{
		}
		
		public function get dataProvider():Object
		{
			return null;
		}
		
		public function set auxProvider(ap:Object):void
		{
		}
		
		public function get auxProvider():Object
		{
			return null;
		}
		
		public function set paneTitle(title:String):void
		{
			_title = title;
		}
		
		public function get paneTitle():String
		{
			return _title;
		}
		
	}
}