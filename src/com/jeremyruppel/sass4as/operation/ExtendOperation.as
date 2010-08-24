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
	import com.jeremyruppel.sass4as.core.ISassStyle;
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
	public class ExtendOperation extends OperationBase
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ExtendOperation( )
		{
			super( /^  @extend ([a-zA-Z\-]+)\s*$/ );
		}

		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		override public function execute( result : Object, parser : ISassParser ) : ISassContext
		{
			var styleName : String = strip( result[ 1 ] );
			
			for each( var style : ISassStyle in parser.styles )
			{
				if( styleName == style.styleName )
				{
					parser.context.extendContext( style );
					
					break;
				}
			}

			return parser.context;
		}
	
	}

}
