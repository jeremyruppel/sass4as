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
	import com.jeremyruppel.sass4as.operation.CatchAllOperation;
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
	public class CatchAllOperationFixture
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
	
		[Test(description="catch all operation should be the last operation in the parsers collection")]
		public function test_catch_all_operation_should_be_the_last_operation_in_the_parsers_collection( ) : void
		{
			assertThat( parser.operations.pop( ), isA( CatchAllOperation ) );
		}
		
		[Test(description="catch all operation raises an error when a line is not matched",expected="com.jeremyruppel.sass4as.error.SassError")]
		public function test_catch_all_operation_raises_an_error_when_a_line_is_not_matched( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
$blue: #49B1FF
!wrong: 12pt
]]>
</sass>;

			parser.parseSass( sass.toString( ) );
		}
		
		[Test(description="catch all operation raises an error when an invalid attribute is given",expected="com.jeremyruppel.sass4as.error.SassError")]
		public function test_catch_all_operation_raises_an_error_when_an_invalid_attribute_is_given( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue
  bad-property: 12px
]]>
</sass>;

			parser.parseSass( sass.toString( ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function CatchAllOperationFixture( )
		{
		}
	
	}

}
