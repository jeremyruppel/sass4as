//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.context
{
	import com.jeremyruppel.sass4as.base.ContextBase;
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
	public class StyleContext extends ContextBase
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function StyleContext( )
		{
		}

		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * @inheritDoc
		 */
		override public function addAttribute( attribute : ISassAttribute ) : void
		{
			attributes.push( attribute );
		}

		/**
		 * @inheritDoc
		 */
		override public function extendContext( context : ISassContext ) : void
		{
			for each( var attribute : ISassAttribute in context.attributes )
			{
				attributes.push( attribute );
			}
		}

	}

}
