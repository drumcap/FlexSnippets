package com.drumcap.snippets.utils 
{
	import flash.net.SharedObject;
	
	[Bindable]
	public class UserPreferences {
		
		private var _sharedObject:SharedObject;
		
		public function UserPreferences(sharedObject:SharedObject):void {
			_sharedObject = sharedObject;
		}
		
		public function get selectedItem():Object
		{
			return _sharedObject.data.selectedItem;
		}
		
		public function set selectedItem(value:Object):void
		{
			trace("SET!!!!!!!!! selectedItemStu");
			_sharedObject.data.selectedItem = value;
			_sharedObject.flush();
		}
		
		
	}
}