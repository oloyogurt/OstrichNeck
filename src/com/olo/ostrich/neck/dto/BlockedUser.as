package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.BlockedUser")]
	public class BlockedUser implements ICloneable
	{
		public var id:Number;
		public var userName:String;
		
		
		public function BlockedUser()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:BlockedUser = (target == null) ? new BlockedUser() : BlockedUser(target);
			
			clone.id = id;
			clone.userName = userName;
		}
		
	}
}