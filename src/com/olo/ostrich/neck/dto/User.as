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
		public var phone:String;
		public var email:String;
		public var twitter:String;
		public var address:String;
		public var city:String;
		public var state:String;
		public var zip:int;
		public var birthMonth:int;
		public var birthDay:int;
		public var birthYear:int;
		public var favFlav:String;
		public var favTop:String;
		public var gender:String;
		public var okToEmail:Boolean;
		public var passwordHash:String;
		public var passwordChangeRqd:Boolean;
		public var lastLogin:Number;
		public var loginCount:Number;
		public var deleted:Boolean;		
		
		public var logicalFlavors:ArrayCollection;
		// TBD public var loyalty:ArrayCollection; 
		
		public function User()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:User = (target == null) ? new User() : User(target);
			
			clone.id = id;
			clone.lastName = lastName;
			clone.firstName = firstName;
			clone.phone = phone;
			clone.email = email;
			clone.twitter = twitter;
			clone.address = address;
			clone.city = city;
			clone.state = state;
			clone.zip = zip;
			clone.birthMonth = birthMonth;
			clone.birthDay = birthDay;
			clone.birthYear = birthYear;
			clone.favFlav = favFlav;
			clone.favTop = favTop;
			clone.gender = gender;
			clone.okToEmail = okToEmail;
			clone.passwordHash = passwordHash;
			clone.passwordChangeRqd = passwordChangeRqd;
			clone.lastLogin = lastLogin;
			clone.loginCount = loginCount;
			clone.deleted = deleted;
			
			return clone;
		}
		
	}
}