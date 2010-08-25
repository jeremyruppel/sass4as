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
	
		/**
		 * Parses sass text into a flash.text.StyleSheet
		 * 
		 * @param sass The sass text to parse into a StyleSheet
		 * @return StyleSheet 
		 */
		function parseSass( sass : String ) : StyleSheet;
		
		/**
		 * Raises an error on behalf of an operation with information about where the error occurred
		 * 
		 * @param error The error to be raised
		 */
		function raise( error : String ) : void;
		
		//--------------------------------------
		//  GETTER / SETTERS
		//--------------------------------------
		
		/**
		 * the list of all of the available operations the parser can interpret
		 */
		function get operations( ) : Vector.<ISassOperation>;
		
		/**
		 * the list of all of the styles defined in the stylesheet
		 */
		function get styles( ) : Vector.<ISassStyle>;
		
		/**
		 * the current context that the line parser assigns attributes to
		 */
		function get context( ) : ISassContext;
		
		/**
		 * the global or '*' context that any new styles inherit from automatically
		 */
		function get globalContext( ) : ISassContext;
		
		/**
		 * a dictionary all of the variables defined in the stylesheet
		 */
		function get variables( ) : Dictionary;
	
	}

}
