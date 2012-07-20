package com.drumcap.snippets.components
{
	import com.drumcap.snippets.utils.UtilComp;
	
	import flash.events.Event;
	
	import mx.controls.ComboBox;
	
	public class BindingComboBox extends ComboBox
	{
		public function BindingComboBox()
		{
			super();
		}
		
		private var _selectedItemToBind:Object;
		
		[Bindable(event="selectedItemToBindChange")]
		public function get selectedItemToBind():Object
		{
			return _selectedItemToBind;
		}

		public function set selectedItemToBind(value:Object):void
		{
			if( _selectedItemToBind !== value)
			{
				_selectedItemToBind = value;
				selectedItem = value;
				selectedIndex = UtilComp.getItemIndex(labelField, value, dataProvider);
				
				dispatchEvent(new Event("selectedItemToBindChange"));
			}
		}
	}
}