//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.base
{
	import com.jeremyruppel.sass4as.core.ISassContext;
	import com.jeremyruppel.sass4as.core.ISassOperation;
	import com.jeremyruppel.sass4as.core.ISassParser;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  18.08.2010
	 */
	public class OperationBase implements ISassOperation
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function OperationBase( pattern : RegExp )
		{
			_pattern = pattern;
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		private var _pattern : RegExp;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		public function get pattern( ) : RegExp
		{
			return _pattern;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		public function test( line : String ) : Boolean
		{
			return pattern.test( line );
		}
		
		public function execute( result : Object, parser : ISassParser ) : ISassContext
		{
			return parser.context;
		}
	
	}

}
