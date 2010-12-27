package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.MachineMaintenance")]
	public class MachineMaintenance implements ICloneable
	{
		public var id:Number;
		public var maintenanceDate:Date;
		public var description:String;
		public var dollarCost:Number;
		
		public var machine:Machine;
		
		
		public function MachineMaintenance()
		{
			maintenanceDate = new Date();
			dollarCost = 0;
		}


		public function clone(target:*=null):*
		{
			var clone:MachineMaintenance = (target == null) ? new MachineMaintenance() : MachineMaintenance(target);
			
			clone.id = id;
			clone.maintenanceDate = maintenanceDate;
			clone.description = description;
			clone.dollarCost = dollarCost;
			
			if (machine == null) machine = new Machine();
			clone.machine = machine.clone();
			
			return clone;
		}
		
	}
}