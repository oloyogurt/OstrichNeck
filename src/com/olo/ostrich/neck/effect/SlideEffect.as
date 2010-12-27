package com.olo.ostrich.neck.effect
{
	import mx.effects.IEffectInstance;
	import mx.effects.TweenEffect;

	public class SlideEffect extends TweenEffect
	{
		public var startValue:Number = 0;
		public var endValue:Number = 1830;
		
		public function SlideEffect(target:Object=null)
		{
			super(target);
			instanceClass = SlideEffectInstance;
		}
		

       override public function getAffectedProperties():Array 
       {
           return ["horizontalScrollPosition"];
       }
    

       override protected function initInstance(inst:IEffectInstance):void 
       {
           super.initInstance(inst);
           SlideEffectInstance(inst).scrollFrom = startValue;
           SlideEffectInstance(inst).scrollTo = endValue;
       } 
		
	}
}