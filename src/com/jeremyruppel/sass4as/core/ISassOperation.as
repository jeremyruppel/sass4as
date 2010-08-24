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
	 * @since  18.08.2010
	 */
	public interface ISassOperation
	{
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		function test( line : String ) : Boolean;
		
		function execute( result : Object, parser : ISassParser ) : ISassContext;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		function get pattern( ) : RegExp;
	
	}

}