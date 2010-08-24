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
	import com.jeremyruppel.sass4as.core.ISassParser;
	import com.jeremyruppel.sass4as.core.ISassStyle;
	import com.jeremyruppel.sass4as.parser.SassParser;
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
	public class EmptyOperationFixture
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
	
		[Test(description="empty operation does not change the parsers context")]
		public function test_empty_operation_does_not_change_the_parsers_context( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue

]]>
</sass>;
			
			parser.parseSass( sass.toString( ) );
			
			assertThat( parser.context, isA( ISassStyle ) );
		}
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function EmptyOperationFixture( )
		{
		}
	
	}

}
