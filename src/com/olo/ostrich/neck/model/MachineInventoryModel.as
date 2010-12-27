package com.olo.ostrich.neck.model
{
	import com.olo.ostrich.neck.dto.ICloneable;
	import com.olo.ostrich.neck.dto.Machine;
	import com.olo.ostrich.neck.dto.MachineInventory;
	import com.olo.ostrich.neck.dto.Yogurt;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.MachineInventoryModel")]
	public class MachineInventoryModel implements ICloneable
	{
		public var machineInventory:MachineInventory;
		public var machine:Machine;
		public var yogurt:Yogurt;
		public var date:Date;
		public var newInventoryCartonCount:int;
		
		
		public function MachineInventoryModel()
		{
		}
		
		
		[Transient] public function get inventoryKey():String
		{
			return String(machine.machineNumber+"_"+machineInventory.hopper);
		}
		
		
		[Transient] static public function getInventoryKey(machine:Machine, hopper:int):String
		{
			return String(machine.machineNumber+"_"+hopper);
		}


		public function clone(target:*=null):*
		{
			var clone:MachineInventoryModel = (target == null) ? new MachineInventoryModel() : MachineInventoryModel(target);
			
			if (machine == null) machine = new Machine();
			if (yogurt == null) yogurt = new Yogurt();
			
			clone.machineInventory = machineInventory.clone();
			clone.machine = machine.clone();
			clone.yogurt = yogurt.clone();
			clone.date = this.date;
			clone.newInventoryCartonCount = this.newInventoryCartonCount;
			
			return clone;
		}
	}
}