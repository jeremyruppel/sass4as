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
	import com.jeremyruppel.sass4as.operation.GlobalOperation;
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
	 * @since  24.08.2010
	 */
	public class GlobalOperationPatternFixture
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
			operation = new GlobalOperation( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="global operation pattern matches star selector")]
		public function test_global_operation_pattern_matches_star_selector( ) : void
		{
			assertThat( "*", re( operation.pattern ) );
		}
		
		[Test(description="global operation only matches star at start of line")]
		public function test_global_operation_only_matches_star_at_start_of_line( ) : void
		{
			assertThat( "  *", not( re( operation.pattern ) ) );
		}
		
		[Test(description="global operation does not match any characters after star")]
		public function test_global_operation_does_not_match_any_characters_after_star( ) : void
		{
			assertThat( "*style", not( re( operation.pattern ) ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function GlobalOperationPatternFixture( )
		{
		}
		
	}

}
