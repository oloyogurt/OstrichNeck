package com.olo.ostrich.neck.command
{
	import flash.events.Event;
	
	public interface IEditCommand
	{
		function execute(event:Event):void;
	}
}