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
	import com.jeremyruppel.sass4as.util.camelcase;
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
	public class CamelCaseFixture
	{
	
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="camelcase removes a hyphen and capitalizes the next letter")]
		public function test_camelcase_removes_a_hyphen_and_capitalizes_the_next_letter( ) : void
		{
			assertThat( camelcase( 'hyphen-ated' ), equalTo( 'hyphenAted' ) );
		}
		
		[Test(description="camelcase removes all hyphens and capitalizes the next letters")]
		public function test_camelcase_removes_all_hyphens_and_capitalizes_the_next_letters( ) : void
		{
			assertThat( camelcase( 'really-really-hyphen-ated' ), equalTo( 'reallyReallyHyphenAted' ) );
		}
		
		[Test(description="camelcase leaves other strings alone")]
		public function test_camelcase_leaves_other_strings_alone( ) : void
		{
			assertThat( camelcase( 'This, right here, is a test.' ), equalTo( 'This, right here, is a test.' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function CamelCaseFixture( )
		{
		}
	
	}

}
