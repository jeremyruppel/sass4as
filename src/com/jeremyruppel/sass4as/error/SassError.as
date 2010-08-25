//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.error
{

	/**
	 * Error subclass.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class SassError extends Error
	{
	
		//--------------------------------------
		// CLASS CONSTANTS
		//--------------------------------------
	
		public static const E_VARIABLE_OVR : String = "Duplicate variable definition encountered. Cannot overwrite variable.";
		
		public static const E_STYLE_OVR : String = "Duplicate style definition encountered. Cannot overwrite style";
		
		public static const E_OPERATION_NOMATCH : String = "No operation found matching line.";
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 * @param message The message that describes this error.
		 */
		public function SassError( message : String )
		{
			super( message );
		}
	
	}

}