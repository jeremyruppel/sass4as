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
	import flash.text.StyleSheet;
	import flash.utils.Dictionary;

	/**
	 * Interface describing the contract for...
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  18.08.2010
	 */
	public interface ISassParser
	{
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		function parseSass( sass : String ) : StyleSheet;
		
		function raise( error : String ) : void;
		
		//--------------------------------------
		//  GETTER / SETTERS
		//--------------------------------------
		
		function get operations( ) : Vector.<ISassOperation>;
		
		function get styles( ) : Vector.<ISassStyle>;
		
		function get context( ) : ISassContext;
		
		function get variables( ) : Dictionary;
	
	}

}
