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
	 * An <code>ISassOperation</code> is triggered by a line matching
	 * the operation's pattern. The operation then performs certain
	 * actions on the <code>ISassParser</code> based on the contents
	 * of that line.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  18.08.2010
	 */
	public interface ISassOperation
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * Tests whether or not the operation's pattern matches the given line
		 */
		function test( line : String ) : Boolean;
		
		/**
		 * Executes the operation on the parser with the result of the match of the current line
		 */
		function execute( result : Object, parser : ISassParser ) : ISassContext;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		/**
		 * Provides access to the operation's pattern
		 */
		function get pattern( ) : RegExp;
	
	}

}