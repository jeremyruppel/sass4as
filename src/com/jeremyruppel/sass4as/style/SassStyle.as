//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.style
{
	import com.jeremyruppel.sass4as.context.StyleContext;
	import com.jeremyruppel.sass4as.core.ISassAttribute;
	import com.jeremyruppel.sass4as.core.ISassStyle;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class SassStyle extends StyleContext implements ISassStyle
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SassStyle( styleName : String )
		{
			_styleName = styleName;
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		private var _styleName : String;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------

		public function get styleName( ) : String
		{
			return _styleName;
		}

		public function get styleObject( ) : Object
		{
			var obj : Object = new Object( );
			
			for each( var attribute : ISassAttribute in attributes )
			{
				obj[ attribute.name ] = attribute.value;
			}

			return obj;
		}

		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		public function toString( ) : String
		{
			return "[ SassStyle name=" + styleName + " ]";
		}
		//--------------------------------------
		//  EVENT HANDLERS
		//--------------------------------------
	
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
	
	}

}
