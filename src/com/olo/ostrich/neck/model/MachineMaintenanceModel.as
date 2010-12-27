package com.olo.ostrich.neck.model
{
	import com.olo.ostrich.neck.dto.ICloneable;
	import com.olo.ostrich.neck.dto.MachineMaintenance;

	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.MachineMaintenanceModel")]
	public class MachineMaintenanceModel implements ICloneable
	{
		public var machineMaintenance:MachineMaintenance;
		public var machineNumber:int;
		
		
		public function MachineMaintenanceModel()
		{
		}
		
		
		public function get maintenanceDate():Date
		{
			var date:Date = null;
			
			if (machineMaintenance)
			{
				date = machineMaintenance.maintenanceDate;
			}
			
			return date;
		}
		
		
		public function get dollarCost():Number
		{
			var cost:Number = 0;
			
			if (machineMaintenance)
			{
				cost = machineMaintenance.dollarCost;
			}
			
			return cost;
		}
		
		
		public function get description():String
		{
			var desc:String = null;
			
			if (machineMaintenance)
			{
				desc = machineMaintenance.description;
			}
			
			return desc;
		}
		

		public function clone(target:*=null):*
		{
			var clone:MachineMaintenanceModel = (target == null) ? new MachineMaintenanceModel() : MachineMaintenanceModel(target);
			
			if (machineMaintenance == null) machineMaintenance = new MachineMaintenance();
			
			clone.machineMaintenance = machineMaintenance.clone();
			clone.machineNumber = this.machineNumber;
			
			return clone;
		}
		
	}
}