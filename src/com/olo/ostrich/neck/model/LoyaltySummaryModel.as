package com.olo.ostrich.neck.model
{
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="com.olo.ostrich.nest.model.LoyaltySummaryModel")]
	public class LoyaltySummaryModel
	{
		public var activeMembers:Number;
		public var claimedNumbers:Number;
		public var unclaimedNumbers:Number;
		public var rewardsGiven:Number;
		public var rewardsRedeemed:Number;
		public var wastedRewards:Number;
		public var outstandingRewards:Number;
		public var birthdayRewards:Number;
		public var loyaltyTrans:Number;
		public var pointsGiven:Number;
		public var pointsEarned:Number;
		public var bonusPointsGiven:Number;
		public var convertedPoints:Number;
		public var claimedPoints:Number;
		public var unexpiredUnconvertedPoints:Number;
		public var wastedPoints:Number;
		public var addressesGiven:Number;
		public var dudes:Number;
		public var chicks:Number;
		public var gaveBirthday:Number;
		public var okToEmail:Number;
		public var gaveTwitter:Number;
		public var unmEmailers:Number;
		public var redemptionRate:Number;
		public var wastedRewardRate:Number;
		public var wastedPointsRate:Number;

		public var zipper:ArrayCollection;		
		
		public function LoyaltySummaryModel()
		{
		}
	}
}