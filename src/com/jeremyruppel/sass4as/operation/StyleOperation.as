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
	import com.jeremyruppel.sass4as.style.SassStyle;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  18.08.2010
	 */
	public class StyleOperation extends OperationBase
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function StyleOperation( )
		{
			super( /^([a-zA-Z0-9\-]+)\s*$/ );
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
		
		override public function execute( result : Object, parser : ISassParser ) : ISassContext
		{
			var style : ISassStyle = new SassStyle( result[ 1 ] );
			
			parser.styles.push( style );
			
			/*
				TODO warn if style is already declared
			*/
			return style;
		}
	
	}

}
