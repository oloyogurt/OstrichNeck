package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.HashReference")]
	public class HashReference implements ICloneable
	{
		public var id:Number;
		public var value:String;
		
		
		public function HashReference()
		{
		}


		public function clone(target:*=null):*
		{
			var clone:HashReference = (target == null) ? new HashReference() : HashReference(target);
			
			clone.id = id;
			clone.value = value;
		}
	}
}