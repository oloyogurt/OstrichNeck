package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.MachineCleaning")]
	public class MachineCleaning implements ICloneable
	{
		public var id:Number;
		public var cleaningDate:Date;
		public var description:String;
		public var poc:String;
		
		public var machine:Machine;
		
	
		public function MachineCleaning()
		{
			cleaningDate = new Date();
		}

		public function clone(target:*=null):*
		{
			var clone:MachineCleaning = (target == null) ? new MachineCleaning() : MachineCleaning(target);
			
			clone.id = id;
			clone.cleaningDate = cleaningDate;
			clone.description = description;
			clone.poc = poc;
			
			if (machine == null) machine = new Machine();
			clone.machine = machine.clone();
			
			return clone;
		}
		
	}
}