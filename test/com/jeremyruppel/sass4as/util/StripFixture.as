//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.util
{
	import com.jeremyruppel.sass4as.util.strip;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class StripFixture
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="strip removes whitespace from the beginning of a string")]
		public function test_strip_removes_whitespace_from_the_beginning_of_a_string( ) : void
		{
			assertThat( strip( '   test' ), equalTo( 'test' ) );
		}
		
		[Test(description="strip removes whitespace from the end of a string")]
		public function test_strip_removes_whitespace_from_the_end_of_a_string( ) : void
		{
			assertThat( strip( 'test   ' ), equalTo( 'test' ) );
		}
		
		[Test(description="strip removes whitespace from the beginning and end of a string")]
		public function test_strip_removes_whitespace_from_the_beginning_and_end_of_a_string( ) : void
		{
			assertThat( strip( '  test  ' ), equalTo( 'test' ) );
		}
		
		[Test(description="strip removes whitespace from the beginning of a string and leaves whitespace inside text intact")]
		public function test_strip_removes_whitespace_from_the_beginning_of_a_string_and_leaves_whitespace_inside_text_intact( ) : void
		{
			assertThat( strip( '  test string' ), equalTo( 'test string' ) );
		}
		
		[Test(description="strip removes whitespace from the end of a string and leaves whitespace inside text intact")]
		public function test_strip_removes_whitespace_from_the_end_of_a_string_and_leaves_whitespace_inside_text_intact( ) : void
		{
			assertThat( strip( 'test string  ' ), equalTo( 'test string' ) );
		}
		
		[Test(description="strip removes whitespace from the beginning and end of a string and leaves whitespace inside text intact")]
		public function test_strip_removes_whitespace_from_the_beginning_and_end_of_a_string_and_leaves_whitespace_inside_text_intact( ) : void
		{
			assertThat( strip( '  test string  ' ), equalTo( 'test string' ) );
		}
		
		[Test(description="strip leaves text without whitespace at the beginning or end unaltered")]
		public function test_strip_leaves_text_without_whitespace_at_the_beginning_or_end_unaltered( ) : void
		{
			assertThat( strip( 'test string' ), equalTo( 'test string' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function StripFixture( )
		{
		}
	
	}

}
