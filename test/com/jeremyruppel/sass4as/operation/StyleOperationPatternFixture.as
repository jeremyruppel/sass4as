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
	import com.jeremyruppel.sass4as.core.ISassOperation;
	import com.jeremyruppel.sass4as.operation.StyleOperation;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.text.re;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class StyleOperationPatternFixture
	{
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var operation : ISassOperation;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			operation = new StyleOperation( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description="style operation pattern matches valid style name")]
		public function test_style_operation_pattern_matches_valid_style_name( ) : void
		{
			assertThat( "body", re( operation.pattern ) );
		}
		
		[Test(description="style operation pattern matches style name followed by space")]
		public function test_style_operation_pattern_matches_style_name_followed_by_space( ) : void
		{
			assertThat( "body  ", re( operation.pattern ) );
		}
		
		[Test(description="style operation pattern does not match style name preceded by space")]
		public function test_style_operation_pattern_does_not_match_style_name_preceded_by_space( ) : void
		{
			assertThat( "  body", not( re( operation.pattern ) ) );
		}
		
		[Test(description="style operation pattern matches mixed case style name")]
		public function test_style_operation_pattern_matches_mixed_case_style_name( ) : void
		{
			assertThat( "bodyText", re( operation.pattern ) );
		}
		
		[Test(description="style operation pattern matches hyphenated style name")]
		public function test_style_operation_pattern_matches_hyphenated_style_name( ) : void
		{
			assertThat( "body-text", re( operation.pattern ) );
		}
		
		[Test(description="style operation pattern matches mixed case hyphenated style name")]
		public function test_style_operation_pattern_matches_mixed_case_hyphenated_style_name( ) : void
		{
			assertThat( "serious-styleProblem", re( operation.pattern ) );
		}
		
		[Test(description="style operation pattern does not match other special characters")]
		public function test_style_operation_pattern_does_not_match_other_special_characters( ) : void
		{
			assertThat( "body!", not( re( operation.pattern ) ) );
		}
		
		[Test(description="style operation pattern captures style name")]
		public function test_style_operation_pattern_captures_style_name( ) : void
		{
			assertThat( operation.pattern.exec( "body" )[ 1 ], equalTo( "body" ) );
		}
		
		[Test(description="style operation pattern does not capture trailing whitespace")]
		public function test_style_operation_pattern_does_not_capture_trailing_whitespace( ) : void
		{
			assertThat( operation.pattern.exec( "body  " )[ 1 ], equalTo( "body" ) );
		}
		
		[Test(description="style operation pattern matches numbers")]
		public function test_style_operation_pattern_matches_numbers( ) : void
		{
			assertThat( "h1", re( operation.pattern ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function StyleOperationPatternFixture( )
		{
		}
	
	}

}
