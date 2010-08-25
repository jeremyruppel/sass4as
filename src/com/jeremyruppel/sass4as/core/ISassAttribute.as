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
	 * An <code>ISassAttribute</code> is a name/value pair that can be
	 * assigned to an <code>ISassContext</code>.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public interface ISassAttribute
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * The name of this attribute.
		 */
		function get name( ) : String;
		
		/**
		 * The value of this attribute.
		 */
		function get value( ) : String;
	}

}