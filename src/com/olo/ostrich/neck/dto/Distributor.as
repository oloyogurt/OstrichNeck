package com.olo.ostrich.neck.dto
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.Distributor")]
	public class Distributor implements ICloneable
	{
		// Keep in synch with server Distributor object
		static private const DELIVERY_TRANSPORT_VALUE:int = 1;
		static private const DELIVERY_TRANSPORT_STR:String = "Delivery";
		static private const PICKUP_TRANSPORT_VALUE:int = 2;
		static private const PICKUP_TRANSPORT_STR:String = "Pickup";
		
		public var id:Number;
		public var name:String;
		public var transport:int;
		public var notes:String;
		public var contactName:String;
		public var contactPhone:String;
		public var contactEmail:String;
		public var webAddress:String;
		public var webOrderAddress:String;
		
		public var inventoryItems:ArrayCollection;
		
		
		public function Distributor()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:Distributor = (target == null) ? new Distributor() : Distributor(target);
		
			clone.id = id;
			clone.name = name;
			clone.transport = transport;
			clone.notes = notes;
			clone.contactName = contactName;
			clone.contactPhone = contactPhone;
			clone.contactEmail = contactEmail;
			clone.webAddress = webAddress;
			clone.webOrderAddress = webOrderAddress;
		
			return clone;
		}
		
		
		[Transient]
		public function get transportString():String
		{
			var value:String = "UNKNOWN";
			
			if (transport == DELIVERY_TRANSPORT_VALUE)
			{
				value = DELIVERY_TRANSPORT_STR;
			}
			else if (transport == PICKUP_TRANSPORT_VALUE)
			{
				value = PICKUP_TRANSPORT_STR;
			}
			
			return value;
		}
	}
}