package com.olo.ostrich.neck.model
{
	import com.olo.ostrich.neck.dto.ICloneable;
	import com.olo.ostrich.neck.dto.MachineCleaning;

	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.MachineCleaningModel")]
	public class MachineCleaningModel implements ICloneable
	{
		public var machineCleaning:MachineCleaning;
		public var machineNumber:int;
		
		
		public function MachineCleaningModel()
		{
		}
		
		
		public function get cleaningDate():Date
		{
			var date:Date = null;
			
			if (machineCleaning)
			{
				date = machineCleaning.cleaningDate;
			}
			
			return date;
		}
		
		
		public function get description():String
		{
			var desc:String = null;
			
			if (machineCleaning)
			{
				desc = machineCleaning.description;
			}
			
			return desc;
		}
		
		
		public function get poc():String
		{
			var poc:String = null;
			
			if (machineCleaning)
			{
				poc = machineCleaning.poc;
			}
			
			return poc;
		}
		

		public function clone(target:*=null):*
		{
			var clone:MachineCleaningModel = (target == null) ? new MachineCleaningModel() : MachineCleaningModel(target);
			
			if (machineCleaning == null) machineCleaning = new MachineCleaning();
			
			clone.machineCleaning = machineCleaning.clone();
			clone.machineNumber = machineNumber;
			
			return clone;
		}
		
	}
}