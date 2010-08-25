//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.core
{

	/**
	 * Interface describing the contract for...
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public interface ISassStyle extends ISassContext
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * The name of this style
		 */
		function get styleName( ) : String;
		
		/**
		 * The style object defining this style's attributes, ready to be passed to <code>StyleSheet.setStyle</code>
		 */
		function get styleObject( ) : Object;
	}

}