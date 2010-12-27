package com.olo.ostrich.neck.util
{
	import flash.display.Sprite;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.events.CloseEvent;
	import mx.formatters.DateFormatter;
	
	public class UtilityCarafe
	{
		static private var df:DateFormatter = new DateFormatter();
		
		[Bindable] static public var daysOfWeek:ArrayCollection = new ArrayCollection([{label:"Sunday", data:1}, 
               																	{label:"Monday", data:2}, 
               																    {label:"Tuesday", data:3},
               																    {label:"Wednesday", data:4},
               																    {label:"Thursday", data:5},
               																    {label:"Friday", data:6},
               																    {label:"Saturday", data:7}]);
		
		
		public function UtilityCarafe()
		{
		}
		
		
		static public function dayOfWeekStr(dayOfWeekInt:int):String
		{
			var dayString:String = "UNKNOWN";
			
			if (dayOfWeekInt == 1)
			{
				dayString = "Sunday";
			}
			else if (dayOfWeekInt == 2)
			{
				dayString = "Monday";
			}
			else if (dayOfWeekInt == 3)
			{
				dayString = "Tuesday";
			}
			else if (dayOfWeekInt == 4)
			{
				dayString = "Wednesday";
			}
			else if (dayOfWeekInt == 5)
			{
				dayString = "Thursday";
			}
			else if (dayOfWeekInt == 6)
			{
				dayString = "Friday";
			}
			else if (dayOfWeekInt == 7)
			{
				dayString = "Saturday";
			}
			
			return dayString;
		}
		
		
		static public function newDateStr():String
		{
			return df.format(new Date());
		}
		
		
		static public function formatDateStr(date:Date):String
		{
			return df.format(date);
		}
		
		
		static private var callbackFunction:Function = null;
		static public function confirmRemoval(deleteDescription:String, callbackFunction:Function):void
		{
			UtilityCarafe.callbackFunction = callbackFunction;
			Alert.show("Really remove "+deleteDescription+"?", "Confirm Removal", (Alert.YES | Alert.NO), Sprite(Application.application), onConfirmResponse);
		}
		
		
		static public function confirmDecision(description:String, callbackFunction:Function):void
		{
			UtilityCarafe.callbackFunction = callbackFunction;
			Alert.show(description, "Please Confirm", (Alert.YES | Alert.NO), Sprite(Application.application), onConfirmResponse);
		}
		
		
		static public function onConfirmResponse(event:CloseEvent):void
		{
			if (event.detail == Alert.YES)
			{
				callbackFunction.call();
			}
		}

	}
}