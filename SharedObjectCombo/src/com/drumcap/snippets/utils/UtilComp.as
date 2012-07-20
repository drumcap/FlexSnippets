package com.drumcap.snippets.utils
{
	public class UtilComp
	{
		/**
		 * 두 객체를 비교해서 해당 인덱스를 반환 
		 * @param fieldName
		 * @param fromData
		 * @param toData
		 * @return 
		 * 
		 */
		public static function getItemIndex(fieldName:String, fromData:Object, toData:Object):int
		{
			if(toData == null) return -1;
			if(!(fieldName in fromData)) return -1;
			if(toData.length == 0) return -1;
			for(var i:int=0; i<toData.length; i++)
			{
				if ( toData[i] != null && toData[i][fieldName] != null) {
					if(toData[i][fieldName] == fromData[fieldName])
					{
						return i;
					}
				}
			}
			return -1;
		}
	}
}