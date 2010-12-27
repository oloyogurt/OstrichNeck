package com.olo.ostrich.neck.dto
{
	import com.olo.ostrich.neck.util.UtilityCarafe;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.Machine")]
	public class Machine implements ICloneable
	{
		// Keep in synch with server Machine object
		static private const SEAFOAM_INT_VALUE:int = 1;
		static private const SEAFOAM_STR_VALUE:String = "Seafoam";
		static private const SEAFOAM_COLOR_VALUE:int = 0x86dfce;
		static private const CRUSHED_BERRIES_INT_VALUE:int = 2;
		static private const CRUSHED_BERRIES_STR_VALUE:String = "Crushed Berries";
		static private const CRUSHED_BERRIES_COLOR_VALUE:int = 0xd05b9a;
		static private const BANANA_INT_VALUE:int = 3;
		static private const BANANA_STR_VALUE:String = "Banana";
		static private const BANANA_COLOR_VALUE:int = 0xfee674;
		static private const BEAR_IN_MIND_INT_VALUE:int = 4;
		static private const BEAR_IN_MIND_STR_VALUE:String = "Bear In Mind";
		static private const BEAR_IN_MIND_COLOR_VALUE:int = 0x5b4a44;
		static private const BELOW_ZERO_INT_VALUE:int = 5;
		static private const BELOW_ZERO_STR_VALUE:String = "Below Zero";
		static private const BELOW_ZERO_COLOR_VALUE:int = 0x86ccec;
		static private const ROSE_FUSION_INT_VALUE:int = 6;
		static private const ROSE_FUSION_STR_VALUE:String = "Rose Fusion"; 
		static private const ROSE_FUSION_COLOR_VALUE:int = 0xf86653;

		
		public var id:Number;
		public var name:String;
		public var machineNumber:int;
		public var color:int;
		public var manufactureDate:Date;
		public var dayOfWeekBreakdown:int
		public var dayOfWeekSanitize:int;
		

		public function Machine()
		{
		}


		public function clone(target:*=null):*
		{
			var clone:Machine = (target == null) ? new Machine() : Machine(target);
			
			clone.id = id;
			clone.name = name;
			clone.machineNumber = machineNumber;
			clone.color = color;
			clone.manufactureDate = manufactureDate;
			clone.dayOfWeekBreakdown = dayOfWeekBreakdown;
			clone.dayOfWeekSanitize = dayOfWeekSanitize;
			
			return clone;
		}
		
		
		[Transient]
		public function get colorText():String
		{
			if (color == SEAFOAM_INT_VALUE) return SEAFOAM_STR_VALUE;
			else if (color == CRUSHED_BERRIES_INT_VALUE) return CRUSHED_BERRIES_STR_VALUE;
			else if (color == BANANA_INT_VALUE) return BANANA_STR_VALUE;
			else if (color == BEAR_IN_MIND_INT_VALUE) return BEAR_IN_MIND_STR_VALUE;
			else if (color == BELOW_ZERO_INT_VALUE) return BELOW_ZERO_STR_VALUE;
			else if (color == ROSE_FUSION_INT_VALUE) return ROSE_FUSION_STR_VALUE;
			else return "UNKOWN";
		}
		
		
		[Transient]
		public function get colorColorValue():int
		{
			if (color == SEAFOAM_INT_VALUE) return SEAFOAM_COLOR_VALUE
			else if (color == CRUSHED_BERRIES_INT_VALUE) return CRUSHED_BERRIES_COLOR_VALUE
			else if (color == BANANA_INT_VALUE) return BANANA_COLOR_VALUE
			else if (color == BEAR_IN_MIND_INT_VALUE) return BEAR_IN_MIND_COLOR_VALUE
			else if (color == BELOW_ZERO_INT_VALUE) return BELOW_ZERO_COLOR_VALUE
			else return ROSE_FUSION_COLOR_VALUE
		}
		
		
		[Transient]
		static public function getColorColorValue(value:int):int
		{
			if (value == SEAFOAM_INT_VALUE) return SEAFOAM_COLOR_VALUE
			else if (value == CRUSHED_BERRIES_INT_VALUE) return CRUSHED_BERRIES_COLOR_VALUE
			else if (value == BANANA_INT_VALUE) return BANANA_COLOR_VALUE
			else if (value == BEAR_IN_MIND_INT_VALUE) return BEAR_IN_MIND_COLOR_VALUE
			else if (value == BELOW_ZERO_INT_VALUE) return BELOW_ZERO_COLOR_VALUE
			else return ROSE_FUSION_COLOR_VALUE
		}
		
		
		[Transient]
		public function get breakdownDayOfWeekStr():String
		{
			return (UtilityCarafe.dayOfWeekStr(dayOfWeekBreakdown));
		}
		
		
		[Transient]
		public function get sanitizeDayOfWeekStr():String
		{
			return (UtilityCarafe.dayOfWeekStr(dayOfWeekSanitize));
		}
		
		
		[Transient]
		public function get daysSinceLastBreakdown():int
		{
			var today:Date = new Date();
			var days:int = (today.day + 1) - dayOfWeekBreakdown;
			if (days < 0)
			{
				days = (7 - dayOfWeekBreakdown) + (today.day+1); 
			}
			
			return days;
		}
		
		
		[Transient]
		public function get daysSinceLastSanitize():int
		{
			var today:Date = new Date();
			var days:int = (today.day + 1) - dayOfWeekSanitize;
			if (days < 0)
			{
				days = (7 - dayOfWeekSanitize) + (today.day+1); 
			}
			
			return Math.min(days, daysSinceLastBreakdown);
		}
		
	}
}