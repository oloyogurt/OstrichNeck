package com.olo.ostrich.neck.wizard.pane
{
	public interface IWizardPane
	{
		[Event("paneUpdate", type="flash.events.Event")]
		
		function showPane():void;
		function hidePane():void;
		function set isValid(value:Boolean):void;
		function get isValid():Boolean;
		function set paneName(name:String):void;
		function get paneName():String;
		function set dataProvider(dp:Object):void;
		function get dataProvider():Object;
		function set auxProvider(ap:Object):void;
		function get auxProvider():Object;
		function set paneTitle(title:String):void;
		function get paneTitle():String;
	}
}