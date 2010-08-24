//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.parser
{
	import com.jeremyruppel.sass4as.core.ISassParser;
	import com.jeremyruppel.sass4as.parser.SassParser;
	import flash.text.StyleSheet;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.isA;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class SassParserFixture
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var parser : ISassParser;

		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			parser = new SassParser( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="sass parser returns a flash stylesheet")]
		public function test_sass_parser_returns_a_flash_stylesheet( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue
]]>
</sass>;
			
			assertThat( parser.parseSass( sass.toString( ) ), isA( StyleSheet ) );
		}
		
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SassParserFixture( )
		{
		}

	}

}
