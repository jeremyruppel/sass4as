//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright 2010 AKQA
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.operation
{
	import com.jeremyruppel.sass4as.base.OperationBase;
	import com.jeremyruppel.sass4as.core.ISassContext;
	import com.jeremyruppel.sass4as.core.ISassParser;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  24.08.2010
	 */
	public class GlobalOperation extends OperationBase
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function GlobalOperation( )
		{
			super( /^\*$/ );
		}
	
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		override public function execute( result : Object, parser : ISassParser ) : ISassContext
		{
			return parser.globalContext;
		}
	
	}

}
