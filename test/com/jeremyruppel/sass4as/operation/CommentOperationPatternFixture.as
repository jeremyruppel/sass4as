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
	import com.jeremyruppel.sass4as.operation.CommentOperation;
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
	public class CommentOperationPatternFixture
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
			operation = new CommentOperation( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="comment operation pattern matches a single line css comment")]
		public function test_comment_operation_pattern_matches_a_single_line_css_comment( ) : void
		{
			assertThat( '/* comment */', re( operation.pattern ) );
		}
		
		[Test(description="comment operation pattern matches bare bones comment")]
		public function test_comment_operation_pattern_matches_bare_bones_comment( ) : void
		{
			assertThat( '/**/', re( operation.pattern ) );
		}
		
		[Test(description="comment operation pattern does not match block comment start")]
		public function test_comment_operation_pattern_does_not_match_block_comment_start( ) : void
		{
			assertThat( '/*', not( re( operation.pattern ) ) );
			assertThat( '/* comment', not( re( operation.pattern ) ) );
		}
		
		[Test(description="comment operation pattern does not match block comment end")]
		public function test_comment_operation_pattern_does_not_match_block_comment_end( ) : void
		{
			assertThat( '*/', not( re( operation.pattern ) ) );
			assertThat( 'comment */', not( re( operation.pattern ) ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function CommentOperationPatternFixture( )
		{
		}
	
	}

}
