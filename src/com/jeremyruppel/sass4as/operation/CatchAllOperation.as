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

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class CatchAllOperation extends OperationBase
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function CatchAllOperation( )
		{
			super( /./ );
		}
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------

		override public function execute( result : Object, parser : ISassParser ) : ISassContext
		{
			parser.raise( SassError.E_OPERATION_NOMATCH );
			
			return parser.context;
		}
	
	}

}
