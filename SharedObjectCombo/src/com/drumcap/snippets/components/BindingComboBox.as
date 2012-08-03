package com.drumcap.snippets.components
{
	import com.drumcap.snippets.utils.UserPreferences;
	import com.drumcap.snippets.utils.UtilComp;
	
	import flash.events.Event;
	
	import mx.controls.ComboBox;
	import mx.utils.ObjectUtil;
	
	public class BindingComboBox extends ComboBox
	{
		
		private var _selectedItemToBind:Object;
		private var _userPreference:UserPreferences;

		[Bindable]
		public function get userPreference():UserPreferences
		{
			return _userPreference;
		}

		public function set userPreference(value:UserPreferences):void
		{
			_userPreference = value;
		}
		
		private var _prefBindName:String;

		public function get prefBindName():String
		{
			return _prefBindName;
		}

		public function set prefBindName(value:String):void
		{
			_prefBindName = value;
		}
		
		[Bindable(event="selectedItemToBindChange")]
		public function get selectedItemToBind():Object
		{
			trace("gggggetSelectedItemToBind");
			return _selectedItemToBind;
		}

		public function set selectedItemToBind(value:Object):void
		{
			if( _selectedItemToBind !== value)
			{
				_selectedItemToBind = value;
				selectedItem = value;
				selectedIndex = UtilComp.getItemIndex(labelField, value, dataProvider);
				trace("setSelectedItemToBind");
				dispatchEvent(new Event("selectedItemToBindChange"));
			}
		}
		
		override public function set dataProvider(value:Object):void
		{
			super.dataProvider = value;
			
			callLater(setCloneDataToBind);
		}
		
		private function setCloneDataToBind():void
		{
			var obj:Object = userPreference[prefBindName];
			userPreference[prefBindName] = ObjectUtil.clone(obj);
		}
	}
}