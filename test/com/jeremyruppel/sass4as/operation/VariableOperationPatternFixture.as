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
	import com.jeremyruppel.sass4as.operation.VariableOperation;
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
	public class VariableOperationPatternFixture
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
			operation = new VariableOperation( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description="variable operation pattern matches variable declaration")]
		public function test_variable_operation_pattern_matches_variable_declaration( ) : void
		{
			assertThat( "$blue:#0000ff", re( operation.pattern ) );
		}
		
		[Test(description="variable operation pattern matches variable declaration and captures variable")]
		public function test_variable_operation_pattern_matches_variable_declaration_and_captures_variable( ) : void
		{
			assertThat( operation.pattern.exec( "$blue:#0000ff" )[ 1 ], equalTo( "$blue" ) );
		}
		
		[Test(description="variable operation pattern matches variable declaration and captures value")]
		public function test_variable_operation_pattern_matches_variable_declaration_and_captures_value( ) : void
		{
			assertThat( operation.pattern.exec( "$blue:#0000ff" )[ 2 ], equalTo( "#0000ff" ) );
		}
		
		[Test(description="variable operation pattern matches variable declaration with space")]
		public function test_variable_operation_pattern_matches_variable_declaration_with_space( ) : void
		{
			assertThat( "$blue: #0000ff", re( operation.pattern ) );
		}
		
		[Test(description="variable operation pattern matches variable declaration with space and captures variable")]
		public function test_variable_operation_pattern_matches_variable_declaration_with_space_and_captures_variable( ) : void
		{
			assertThat( operation.pattern.exec( "$blue: #0000ff" )[ 1 ], equalTo( "$blue" ) );
		}
		
		[Test(description="variable operation pattern matches variable declaration with space and captures value")]
		public function test_variable_operation_pattern_matches_variable_declaration_with_space_and_captures_value( ) : void
		{
			assertThat( operation.pattern.exec( "$blue: #0000ff" )[ 2 ], equalTo( "#0000ff" ) );
		}
		
		[Test(description="variable operation pattern matches mixed case variable")]
		public function test_variable_operation_pattern_matches_mixed_case_variable( ) : void
		{
			assertThat( "$Hello: 15px",     re( operation.pattern ) );
			assertThat( "$camelCase: 15px", re( operation.pattern ) );
		}
		
		[Test(description="variable operation pattern matches hyphenated variable")]
		public function test_variable_operation_pattern_matches_hyphenated_variable( ) : void
		{
			assertThat( "$some-variable: 15px", re( operation.pattern ) );
		}
		
		[Test(description="variable operation pattern matches hyphenated mixed case variable")]
		public function test_variable_operation_pattern_matches_hyphenated_mixed_case_variable( ) : void
		{
			assertThat( "$serious-styleProblem: 15px", re( operation.pattern ) );
		}
		
		[Test(description="variable operation pattern does not match indented variable")]
		public function test_variable_operation_pattern_does_not_match_indented_variable( ) : void
		{
			assertThat( "  $blue: 15px", not( re( operation.pattern ) ) );
		}
		
		[Test(description="variable operation pattern does not match other special characters")]
		public function test_variable_operation_pattern_does_not_match_other_special_characters( ) : void
		{
			assertThat( "$blue!: 15px", not( re( operation.pattern ) ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function VariableOperationPatternFixture( )
		{
		}

	}

}
