package com.olo.ostrich.neck.event
{
	import com.olo.ostrich.neck.dto.EggConfig;
	import com.olo.ostrich.neck.dto.VideoInfo;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class ConfigUtilitiesEvent extends Event
	{
		static public const FETCH_ALL_DIRTY_WORDS:String = "fetchAllDirtyWords";
		static public const ADD_DIRTY_WORDS:String = "updateDirtyWords";
		static public const SAVE_DIRTY_WORDS:String = "saveDirtyWords";
		static public const DELETE_DIRTY_WORDS:String = "deleteDirtyWords";
		static public const FETCH_ALL_HASH_REF:String = "fetchAllHashRef";
		static public const ADD_HASH_REF:String = "updateHashRef";
		static public const SAVE_HASH_REF:String = "saveHashRef";
		static public const DELETE_HASH_REF:String = "deleteHashRef";
		static public const FETCH_EGG_CONFIG:String = "fetchEggConfig";
		static public const UPDATE_EGG_CONFIG:String = "updateEggConfig";
		static public const SAVE_EGG_CONFIG:String = "saveEggConfig";
		static public const FETCH_VIDEO_INFO:String = "fetchVideoInfo";
		static public const UPDATE_VIDEO_INFO:String = "updateVideoInfo";
		static public const SAVE_VIDEO_INFO:String = "saveVideoInfo";
		
		public var dirtyWords:ArrayCollection = null;
		public var hashReferences:ArrayCollection = null;
		public var eggConfig:EggConfig = null;
		public var videoInfo:VideoInfo = null;

		public function ConfigUtilitiesEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}