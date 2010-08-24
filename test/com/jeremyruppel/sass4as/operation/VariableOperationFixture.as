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
	import com.jeremyruppel.sass4as.parser.SassParser;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.notNullValue;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class VariableOperationFixture
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
	
		[Test(description="variable operation sets a variable on the parser")]
		public function test_variable_operation_sets_a_variable_on_the_parser( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
$blue: #49B1FF
]]>
</sass>;

			parser.parseSass( sass.toString( ) );
			
			assertThat( parser.variables[ '$blue' ], notNullValue( ) );
		}
		
		[Test(description="variable operation sets correct value for the variable")]
		public function test_variable_operation_sets_correct_value_for_the_variable( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
$blue: #49B1FF
]]>
</sass>;

			parser.parseSass( sass.toString( ) );

			assertThat( parser.variables[ '$blue' ], equalTo( '#49B1FF' ) );
		}
		
		[Test(description="variable operation throws error if duplicate is encountered",expected="com.jeremyruppel.sass4as.error.SassError")]
		public function test_variable_operation_throws_error_if_duplicate_is_encountered( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
$blue: #49B1FF
$something: 12pt
$blue: #0000FF
]]>
</sass>;

			parser.parseSass( sass.toString( ) );
		}
		
		[Test(description="variable operation uses strip to strip variable value")]
		public function test_variable_operation_uses_strip_to_strip_variable_value( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
$blue:    #49B1FF  
]]>
</sass>;

			parser.parseSass( sass.toString( ) );
			
			assertThat( parser.variables[ '$blue' ], equalTo( '#49B1FF' ) );
		}
		
		[Test(description="variable operation uses cssvalue to coerce variable value")]
		public function test_variable_operation_uses_cssvalue_to_coerce_variable_value( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
$size: 12pt
]]>
</sass>;

			parser.parseSass( sass.toString( ) );
			
			assertThat( parser.variables[ '$size' ], equalTo( 12 ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function VariableOperationFixture( )
		{
		}
	
	}

}
