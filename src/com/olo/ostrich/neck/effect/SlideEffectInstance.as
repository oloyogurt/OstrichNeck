package com.olo.ostrich.neck.effect
{
	import mx.effects.Tween;
	import mx.effects.effectClasses.TweenEffectInstance;

	public class SlideEffectInstance extends TweenEffectInstance
	{
		public var scrollFrom:Number;
        public var scrollTo:Number;
        
		public function SlideEffectInstance(target:*)
		{
			super(target);
		}
		
        override public function play():void 
        {
            super.play();
            
            var tween:Tween = createTween(this, scrollFrom, scrollTo, duration);  
        }


        override public function onTweenUpdate(val:Object):void 
        {
            target.horizontalScrollPosition = val;
        }
  

        override public function onTweenEnd(val:Object):void 
        {
            super.onTweenEnd(val);
        }
		
	}
}