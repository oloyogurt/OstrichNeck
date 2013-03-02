package com.olo.ostrich.neck.dto
{
	import flash.external.ExternalInterface;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.Yogurt")]
	public class Yogurt extends ItemDetailBase implements ICloneable
	{
		public var id:Number;
		public var manufactureName:String;
		public var oloName:String;
		public var manufacturer:String;
		public var ingredients:String;
		public var nsa:Boolean;
		public var kosher:Boolean;
		public var lacSeal:Boolean;
		public var nonDairy:Boolean;
		public var organic:Boolean;
		public var tart:Boolean;
		public var nonFat:Boolean;
		public var lowFat:Boolean;
		public var servingSize:int;
		public var calories:int;
		public var calFromFat:int;
		public var totalFat:int;
		public var saturatedFat:int;
		public var transFat:int;
		public var cholesterol:int;
		public var sodium:int;
		public var carbs:int;
		public var fiber:int;
		public var sugars:int;
		public var protein:int;
		public var vitaminA:int;
		public var vitaminC:int;
		public var calcium:int;
		public var iron:int;
		public var riboflavin:int;
		public var activeCultures:String;
		public var contains:String;

	
		public function Yogurt()
		{
		}
		
		
		public function clone(target:*=null):*
		{
			var clone:Yogurt = (target == null) ? new Yogurt() : Yogurt(target);
			
			clone.id = id;
			clone.manufactureName = manufactureName;
			clone.oloName = oloName;
			clone.manufacturer = manufacturer;
			clone.ingredients = ingredients;
			clone.nsa = nsa;
			clone.kosher = kosher;
			clone.lacSeal = lacSeal;
			clone.nonDairy = nonDairy;
			clone.organic = organic;
			clone.tart = tart;
			clone.nonFat = nonFat;
			clone.lowFat = lowFat;
			clone.servingSize = servingSize;
			clone.calories = calories;
			clone.calFromFat = calFromFat;
			clone.totalFat = totalFat;
			clone.saturatedFat = saturatedFat;
			clone.transFat = transFat;
			clone.cholesterol = cholesterol;
			clone.sodium = sodium;
			clone.carbs = carbs;
			clone.fiber = fiber;
			clone.sugars = sugars;
			clone.protein = protein;
			clone.vitaminA = vitaminA;
			clone.vitaminC = vitaminC;
			clone.calcium = calcium;
			clone.iron = iron;
			clone.riboflavin = riboflavin;
			clone.activeCultures = activeCultures;
			clone.contains = contains;
			
			return clone;
		}
		
		
		public function fromXML(yogurtXML:XML):void
		{
			id = 0;
			oloName = yogurtXML.name;
			manufactureName = yogurtXML.yocreamName;
			manufacturer = yogurtXML.manufacturer;
			ingredients = yogurtXML.ingredients;
			nsa = (yogurtXML.hasOwnProperty("nsa")) ? true : false;
			kosher = (yogurtXML.hasOwnProperty("kosher")) ? true : false;
			lacSeal = (yogurtXML.hasOwnProperty("lacSeal")) ? true : false;
			nonDairy = (yogurtXML.hasOwnProperty("nonDairy")) ? true : false;
			organic = (yogurtXML.hasOwnProperty("organic")) ? true : false;
			tart = (yogurtXML.hasOwnProperty("tart")) ? true : false;
			nonFat = (yogurtXML.hasOwnProperty("nonFat")) ? true : false;
			lowFat = (yogurtXML.hasOwnProperty("lowFat")) ? true : false;
			servingSize = yogurtXML.servingSize;
			calories = yogurtXML.calories;
			calFromFat = yogurtXML.calFromFat;
			var totalFatStr:String = yogurtXML.totalFat;
			totalFat = totalFatStr.match(/^\d+/)[0];
			var saturatedFatStr:String = yogurtXML.saturatedFat;
			saturatedFat = saturatedFatStr.match(/^\d+/)[0];
			var transFatStr:String = yogurtXML.transFat;
			transFat = transFatStr.match(/^\d+/)[0];
			var cholesterolStr:String = yogurtXML.cholesterol;
			cholesterol = cholesterolStr.match(/^\d+/)[0];
			var sodiumStr:String = yogurtXML.sodium;
			sodium = sodiumStr.match(/^\d+/)[0];
			var carbsStr:String = yogurtXML.totalCarbs;
			carbs = carbsStr.match(/^\d+/)[0];
			var fiberStr:String = yogurtXML.fiber;
			fiber = fiberStr.match(/^\d+/)[0];
			var sugarsString:String = yogurtXML.sugars;
			sugars = sugarsString.match(/^\d+/)[0];
			var proteinStr:String = yogurtXML.protein;
			protein = proteinStr.match(/^\d+/)[0];
			var vitAStr:String = yogurtXML.vitA;
			vitaminA = vitAStr.match(/^\d+/)[0];
			var vitCStr:String = yogurtXML.vitC;
			vitaminC = vitCStr.match(/^\d+/)[0];
			var calciumStr:String = yogurtXML.calcium;
			calcium = calciumStr.match(/^\d+/)[0];
			var ironStr:String = yogurtXML.iron;
			iron = ironStr.match(/^\d+/)[0];
			var riboStr:String = yogurtXML.riboflavin;
			riboflavin = riboStr.match(/^\d+/)[0];
			activeCultures = yogurtXML.activeCultures;
			contains = yogurtXML.contains;
			
			print();			
		}
		
		
		public function print():void
		{
			trace("id: "+id);
			trace("manufactureName: "+manufactureName);
			trace("oloName: "+oloName);
			trace("manufacturer: "+manufacturer);
			trace("ingredients: "+ingredients);
			trace("nsa: "+nsa);
			trace("kosher: "+kosher);
			trace("lacSeal: "+lacSeal);
			trace("nonDairy: "+nonDairy);
			trace("organic: "+organic);
			trace("tart: "+tart);
			trace("nonFat: "+nonFat);
			trace("lowFat: "+lowFat);
			trace("servingSize: "+servingSize);
			trace("calories: "+calories);
			trace("calFromFat: "+calFromFat);
			trace("totalFat: "+totalFat);
			trace("saturatedFat: "+saturatedFat);
			trace("transFat: "+transFat);
			trace("cholesterol: "+cholesterol);
			trace("sodium: "+sodium);
			trace("carbs: "+carbs);
			trace("fiber: "+fiber);
			trace("sugars: "+sugars);
			trace("protein: "+protein);
			trace("vitaminA: "+vitaminA);
			trace("vitaminC: "+vitaminC);
			trace("calcium: "+calcium);
			trace("iron: "+iron);
			trace("riboflavin: "+riboflavin);
			trace("activeCultures: "+activeCultures);
			trace("contains: "+contains);
		}

	}
}