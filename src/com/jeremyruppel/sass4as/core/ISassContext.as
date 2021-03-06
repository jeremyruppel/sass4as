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
	 * An <code>ISassContext</code> represents the current context
	 * of the <code>ISassParser</code> as it evaluates the document.
	 * A context contains a list of attributes and may extend other
	 * contexts.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  18.08.2010
	 */
	public interface ISassContext
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * Adds an <code>ISassAttribute</code> to this context
		 */
		function addAttribute( attribute : ISassAttribute ) : void;
		
		/**
		 * Adds all <code>ISassAttributes</code> from the specified <code>ISassContext</code> to this context
		 */
		function extendContext( context : ISassContext ) : void;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * A list of all <code>ISassAttribute</code> instances that have been added to this context
		 */
		function get attributes( ) : Vector.<ISassAttribute>;
	}

}