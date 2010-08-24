//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.operation
{
	import com.jeremyruppel.sass4as.attribute.SassAttribute;
	import com.jeremyruppel.sass4as.base.OperationBase;
	import com.jeremyruppel.sass4as.core.ISassContext;
	import com.jeremyruppel.sass4as.core.ISassParser;
	import com.jeremyruppel.sass4as.util.camelcase;
	import com.jeremyruppel.sass4as.util.cssvalue;
	import com.jeremyruppel.sass4as.util.strip;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  18.08.2010
	 */
	public class AttributeOperation extends OperationBase
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function AttributeOperation( )
		{
			super( /^  (color|text-(?:indent|decoration|align)|display|kerning|font-(?:s(?:tyle|ize)|family|weight)|le(?:tter-spacing|ading)|margin-(?:left|right)): ?(.+)$/s );
		}

		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		override public function execute( result : Object, parser : ISassParser ) : ISassContext
		{
			var name : String = camelcase( result[ 1 ] );
			
			var value : * = cssvalue( strip( result[ 2 ] ) );
			
			if( null != parser.variables[ value ] )
			{
				value = parser.variables[ value ]
			}

			parser.context.addAttribute( new SassAttribute( name, value ) );
			
			return parser.context;
		}
	
	}

}