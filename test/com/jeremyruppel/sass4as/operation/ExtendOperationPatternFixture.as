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
	import com.jeremyruppel.sass4as.operation.ExtendOperation;
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
	public class ExtendOperationPatternFixture
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
			operation = new ExtendOperation( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description="extend operation pattern matches valid extend directive")]
		public function test_extend_operation_pattern_matches_valid_extend_directive( ) : void
		{
			assertThat( "  @extend some-class", re( operation.pattern ) );
		}
		
		[Test(description="extend operation pattern does not match extend directive without two preceding spaces")]
		public function test_extend_operation_pattern_does_not_match_extend_directive_without_two_preceding_spaces( ) : void
		{
			assertThat( " @extend some-class", not( re( operation.pattern ) ) );
			assertThat( "@extend some-class",  not( re( operation.pattern ) ) );
		}
		
		[Test(description="extend operation pattern does not match extend directive without class name")]
		public function test_extend_operation_pattern_does_not_match_extend_directive_without_class_name( ) : void
		{
			assertThat( "  @extend ", not( re( operation.pattern ) ) );
		}
		
		[Test(description="extend operation pattern does not match extend directive preceded by tab")]
		public function test_extend_operation_pattern_does_not_match_extend_directive_preceded_by_tab( ) : void
		{
			assertThat( "	@extend some-class", not( re( operation.pattern ) ) );
		}
		
		[Test(description="extend operation pattern does not match colon")]
		public function test_extend_operation_pattern_does_not_match_colon( ) : void
		{
			assertThat( "  @extend: some-class", not( re( operation.pattern ) ) );
		}
		
		[Test(description="extend operation pattern does not match special characters in class name")]
		public function test_extend_operation_pattern_does_not_match_special_characters_in_class_name( ) : void
		{
			assertThat( "  @extend some_class", not( re( operation.pattern ) ) );
		}
		
		[Test(description="extend operation pattern captures the class name")]
		public function test_extend_operation_pattern_captures_the_class_name( ) : void
		{
			assertThat( operation.pattern.exec( "  @extend some-class" )[ 1 ], equalTo( "some-class" ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ExtendOperationPatternFixture( )
		{
		}
	
	}

}
