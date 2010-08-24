//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.attribute
{
	import com.jeremyruppel.sass4as.core.ISassAttribute;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class SassAttribute implements ISassAttribute
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SassAttribute( name : String, value : * )
		{
			_name  = name;
			_value = value;
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _name : String;
		
		/**
		 * @private
		 */
		private var _value : *;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
	
		/**
		 * @inheritDoc
		 */
		public function get name( ) : String
		{
			return _name;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get value( ) : *
		{
			return _value;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		/**
		 * A string representation of this object
		 */
		public function toString( ) : String
		{
			return "[ SassAttribute name=" + name + ", value=" + value + " ]";
		}
	
	}

}
