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
	import flash.text.StyleSheet;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.anything;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.hasProperties;
	import org.hamcrest.object.hasProperty;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class AttributeOperationFixture
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
	
		[Test(description="attribute operation adds one attribute to a style")]
		public function test_attribute_operation_adds_one_attribute_to_a_style( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'body' ), hasProperty( 'fontFamily', anything( ) ) );
		}
		
		[Test(description="attribute operation adds multiple attributes to a style")]
		public function test_attribute_operation_adds_multiple_attributes_to_a_style( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue
  font-size: 12pt
  color: #333333
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'body' ), hasProperties( { fontFamily : anything( ), fontSize : anything( ), color : anything( ) } ) );
		}
		
		[Test(description="attribute operation adds multiple attributes to a style with correct values")]
		public function test_attribute_operation_adds_multiple_attributes_to_a_style_with_correct_values( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue
  font-size: 12pt
  color: #333333
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'body' ), hasProperties( { fontFamily : "Helvetica Neue", fontSize : 12, color : "#333333" } ) );
		}
		
		[Test(description="attribute operation resolves variables in attribute values")]
		public function test_attribute_operation_resolves_variables_in_attribute_values( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
$size: 12pt
body
  font-family: Helvetica Neue
  font-size: $size
  color: #333333
]]>
</sass>;
			
			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'body' ).fontSize, equalTo( 12 ) );
		}
		
		[Test(description="attribute operation uses camelcase to format attribute names")]
		public function test_attribute_operation_uses_camelcase_to_format_attribute_names( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue
  font-size: 12pt
  color: #333333
]]>
</sass>;
			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'body' ), not( hasProperty( 'font-family' ) ) );
			assertThat( styleSheet.getStyle( 'body' ), hasProperty( 'fontFamily' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function AttributeOperationFixture( )
		{
		}
	
	}

}
