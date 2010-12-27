package com.olo.ostrich.neck.dto
{
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.dto.DirtyWord")]
	public class DirtyWord implements ICloneable
	{
		public var id:Number;
		public var word:String;
		
		
		public function DirtyWord()
		{
		}

		public function clone(target:*=null):*
		{
			var clone:DirtyWord = (target == null) ? new DirtyWord() : DirtyWord(target);
			
			clone.id = id;
			clone.word = word;
		}
		
	}
}