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
	import com.jeremyruppel.sass4as.core.ISassAttribute;
	import com.jeremyruppel.sass4as.core.ISassContext;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class ContextBase implements ISassContext
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ContextBase( )
		{
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _attributes : Vector.<ISassAttribute>;
		
		//--------------------------------------
		//  GETTER / SETTERS
		//--------------------------------------
		
		/**
		 * 
		 */
		public function get attributes( ) : Vector.<ISassAttribute>
		{
			return _attributes || ( _attributes = new Vector.<ISassAttribute>( ) );
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		public function addAttribute( attribute : ISassAttribute ) : void
		{
		}

		public function extendContext( context : ISassContext ) : void
		{
		}
	
	}

}
