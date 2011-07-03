package com.olo.ostrich.neck.model
{
	import com.olo.ostrich.neck.dto.ICloneable;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.FlavorModel")]
	public class FlavorModel implements ICloneable
	{
		public var flavor1Name:String;
		public var flavor2Name:String;
		public var flavor3Name:String;
		public var flavor4Name:String;
		public var flavor5Name:String;
		public var flavor6Name:String;
		public var flavor7Name:String;
		public var flavor8Name:String;
		public var flavor9Name:String;
		public var flavor10Name:String;
		
		public function FlavorModel()
		{
		}
		
		
		public function clone(target:*=null):*
		{
			var clone:FlavorModel = (target == null) ? new FlavorModel() : FlavorModel(target);
			
			clone.flavor1Name = flavor1Name;
			clone.flavor2Name = flavor2Name;
			clone.flavor3Name = flavor3Name;
			clone.flavor4Name = flavor4Name;
			clone.flavor5Name = flavor5Name;
			clone.flavor6Name = flavor6Name;
			clone.flavor7Name = flavor7Name;
			clone.flavor8Name = flavor8Name;
			clone.flavor9Name = flavor9Name;
			clone.flavor10Name = flavor10Name;
			
			return clone;
		}

	}
}