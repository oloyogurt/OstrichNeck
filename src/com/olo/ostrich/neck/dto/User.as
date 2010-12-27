package com.olo.ostrich.neck.dto
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.User")]
	public class User implements ICloneable
	{
		public var id:Number;
		public var lastName:String;
		public var firstName:String;
		public var email:String;
		public var twitter:String;
		public var facebook:String;
		public var webAddress:String;
		public var city:String;
		public var state:String;
		public var zip:String;
		
		public var logicalFlavors:ArrayCollection;
		
		
		public function User()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:User = (target == null) ? new User() : User(target);
			
			clone.id = id;
			clone.lastName = lastName;
			clone.firstName = firstName;
			clone.email = email;
			clone.twitter = twitter;
			clone.facebook = facebook;
			clone.webAddress = webAddress;
			clone.city = city;
			clone.state = state;
			clone.zip = zip;
			
			return clone;
		}
		
	}
}