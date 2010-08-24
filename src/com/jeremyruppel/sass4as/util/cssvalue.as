//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.util
{

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public function cssvalue( string : String ) : *
	{
		var pattern : RegExp = /^([\d\.]+)(p(x|t)|em)?/;
		
		if( pattern.test( string ) )
		{
			return parseFloat( pattern.exec( string )[ 1 ] );
		}
		
		return string;
	}

}