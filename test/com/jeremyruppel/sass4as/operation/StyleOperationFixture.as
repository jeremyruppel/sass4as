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
	import org.hamcrest.collection.array;
	import org.hamcrest.collection.hasItems;
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
	public class StyleOperationFixture
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
	
		[Test(description="style operation adds a style to the parsers style collection")]
		public function test_style_operation_adds_a_style_to_the_parsers_style_collection( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue

]]>
</sass>;

			parser.parseSass( sass.toString( ) );

			assertThat( parser.styles.length, equalTo( 1 ) );
		}
		
		[Test(description="style operation correctly names a style in the parsers style collection")]
		public function test_style_operation_correctly_names_a_style_in_the_parsers_style_collection( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue

]]>
</sass>;

			parser.parseSass( sass.toString( ) );

			assertThat( parser.styles[ 0 ].styleName, equalTo( "body" ) );
		}
		
		[Test(description="style operation adds a style to the stylesheet result")]
		public function test_style_operation_adds_a_style_to_the_stylesheet_result( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue

]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.styleNames, array( "body" ) );
		}
		
		[Test(description="style operation can add multiple styles to the stylesheet result")]
		public function test_style_operation_can_add_multiple_styles_to_the_stylesheet_result( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  color: #ff0055

header
  color: #333333

footer
  color: #456789

]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.styleNames, hasItems( equalTo( "body" ), equalTo( "header" ), equalTo( "footer" ) ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function StyleOperationFixture( )
		{
		}
	
	}

}
