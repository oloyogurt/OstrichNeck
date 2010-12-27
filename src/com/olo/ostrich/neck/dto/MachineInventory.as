package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.MachineInventory")]
	public class MachineInventory implements ICloneable
	{
		// Keep in sync with server side
		static public const TRENDING_UP_VALUE:int = 1;
		static public const TRENDING_DOWN_VALUE:int = 2;
		static public const TRENDING_UP_STR:String = "Up";
		static public const TRENDING_DOWN_STR:String = "Down";
		
		public var id:Number;
		public var totalCartons:int;
		public var startDate:Date;
		public var endDate:Date;
		public var hopper:int;
		public var active:Boolean;
		public var avgCartonsPerDay:Number;
		public var currentRank:int;
		public var currentTrending:int;
		
		
		public function MachineInventory()
		{
		}


		public function clone(target:*=null):*
		{
			var clone:MachineInventory = (target == null) ? new MachineInventory() : MachineInventory(target);
			
			clone.id = id;
			clone.totalCartons = totalCartons;
			clone.startDate = startDate;
			clone.endDate = endDate;
			clone.hopper = hopper;
			clone.active = active;
			clone.avgCartonsPerDay = avgCartonsPerDay;
			clone.currentRank = currentRank;
			clone.currentTrending = currentTrending;
			
			return clone;
		}
		
		
		[Transient] public function get currentTrendingStr():String
		{
			if (currentTrending == TRENDING_DOWN_VALUE) return TRENDING_DOWN_STR;
			else return TRENDING_UP_STR;
		}
		
	}
}