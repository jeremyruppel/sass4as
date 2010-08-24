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
	import com.jeremyruppel.sass4as.operation.EmptyOperation;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.not;
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
	public class EmptyOperationPatternFixture
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
			operation = new EmptyOperation( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		[Test(description="empty operation pattern matches empty string")]
		public function test_empty_operation_pattern_matches_empty_string( ) : void
		{
			assertThat( "", re( operation.pattern ) );
		}
		
		[Test(description="empty operation pattern matches single space")]
		public function test_empty_operation_pattern_matches_single_space( ) : void
		{
			assertThat( " ", re( operation.pattern ) );
		}
		
		[Test(description="empty operation pattern matches multiple spaces")]
		public function test_empty_operation_pattern_matches_multiple_spaces( ) : void
		{
			assertThat( "    ", re( operation.pattern ) );
		}
	
		[Test(description="empty operation pattern does not match nonspace character")]
		public function test_empty_operation_pattern_does_not_match_nonspace_character( ) : void
		{
			assertThat( "a", not( re( operation.pattern ) ) );
		}
		
		[Test(description="empty operation pattern does not match nonspace character preceded by space")]
		public function test_empty_operation_pattern_does_not_match_nonspace_character_preceded_by_space( ) : void
		{
			assertThat( " a", not( re( operation.pattern ) ) );
		}
		
		[Test(description="empty operation pattern does not match nonspace character followed by space")]
		public function test_empty_operation_pattern_does_not_match_nonspace_character_followed_by_space( ) : void
		{
			assertThat( "a ", not( re( operation.pattern )  ) );
		}
		
		[Test(description="empty operation pattern does not match nonspace character preceded and followed by space")]
		public function test_empty_operation_pattern_does_not_match_nonspace_character_preceded_and_followed_by_space( ) : void
		{
			assertThat( " a ", not( re( operation.pattern ) ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function EmptyOperationPatternFixture( )
		{
		}
	
	}

}
