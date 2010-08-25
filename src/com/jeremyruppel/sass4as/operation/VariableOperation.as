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
	import com.jeremyruppel.sass4as.base.OperationBase;
	import com.jeremyruppel.sass4as.core.ISassContext;
	import com.jeremyruppel.sass4as.core.ISassParser;
	import com.jeremyruppel.sass4as.error.SassError;
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
	public class VariableOperation extends OperationBase
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function VariableOperation( )
		{
			super( /^(\$[a-zA-Z0-9\-]+): ?(.+)$/s );
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		/**
		 * @inheritDoc
		 */
		override public function execute( result : Object, parser : ISassParser ) : ISassContext
		{
			if( null == parser.variables[ result[ 1 ] ] )
			{
				parser.variables[ result[ 1 ] ] = cssvalue( strip( result[ 2 ] ) );
			}
			else
			{
				parser.raise( SassError.E_VARIABLE_OVR );
			}
			
			return parser.context;
		}
	
	}

}
