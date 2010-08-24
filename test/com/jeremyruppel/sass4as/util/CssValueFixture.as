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
	import com.jeremyruppel.sass4as.util.cssvalue;
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
	public class CssValueFixture
	{
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="cssvalue removes pt and converts to number")]
		public function test_cssvalue_removes_pt_and_converts_to_number( ) : void
		{
			assertThat( cssvalue( '12pt' ), equalTo( 12 ) );
		}
		
		[Test(description="cssvalue removes pt from decimal and converts to number")]
		public function test_cssvalue_removes_pt_from_decimal_and_converts_to_number( ) : void
		{
			assertThat( cssvalue( '12.1pt' ), equalTo( 12.1 ) );
		}
		
		[Test(description="cssvalue removes px and converts to number")]
		public function test_cssvalue_removes_px_and_converts_to_number( ) : void
		{
			assertThat( cssvalue( '24px' ), equalTo( 24 ) );
		}
		
		[Test(description="cssvalue removes px from decimal and converts to number")]
		public function test_cssvalue_removes_px_from_decimal_and_converts_to_number( ) : void
		{
			assertThat( cssvalue( '24.1px' ), equalTo( 24.1 ) );
		}
		
		[Test(description="cssvalue removes em and converts to number")]
		public function test_cssvalue_removes_em_and_converts_to_number( ) : void
		{
			assertThat( cssvalue( '10em' ), equalTo( 10 ) );
		}
		
		[Test(description="cssvalue removes em from decimal and converts to number")]
		public function test_cssvalue_removes_em_from_decimal_and_converts_to_number( ) : void
		{
			assertThat( cssvalue( '0.3em' ), equalTo( 0.3 ) );
		}
	
		[Test(description="cssvalue converts numbers without units to numbers")]
		public function test_cssvalue_converts_numbers_without_units_to_numbers( ) : void
		{
			assertThat( cssvalue( '10' ), equalTo( 10 ) );
		}
		
		[Test(description="cssvalue converts decimals without units to numbers")]
		public function test_cssvalue_converts_decimals_without_units_to_numbers( ) : void
		{
			assertThat( cssvalue( '0.1' ), equalTo( 0.1 ) );
		}
		
		[Test(description="cssvalue leaves other strings alone")]
		public function test_cssvalue_leaves_other_strings_alone( ) : void
		{
			assertThat( cssvalue( 'Helvetica Neue' ), equalTo( 'Helvetica Neue' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function CssValueFixture( )
		{
		}
	
	}

}
