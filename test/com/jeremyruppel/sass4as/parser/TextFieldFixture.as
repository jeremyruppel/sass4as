//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as.parser
{
	import com.jeremyruppel.sass4as.core.ISassParser;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import org.hamcrest.assertThat;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.isTrue;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class TextFieldFixture
	{
		//--------------------------------------
		//  CLASS CONSTANTS
		//--------------------------------------
		
		private const test : XML = 
<test>
<![CDATA[
$blue: #32DAFF

body
  font-size: 14pt
  font-family: Helvetica Neue
  color: $blue

header
  @extend body
  font-size: 20pt
  text-decoration: underline
]]>
</test>;

		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var textField : TextField;		
		private var parser    : ISassParser;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			parser = new SassParser( );
			
			textField = new TextField( );
			
			textField.styleSheet = parser.parseSass( test.toString( ) );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="text field uses body font size")]
		public function test_text_field_uses_body_font_size( ) : void
		{
			textField.htmlText = "<body>Hello!</body>";
			
			var textFormat : TextFormat = textField.getTextFormat( 1, 2 );
			
			assertThat( textFormat.size, equalTo( 14 ) );
		}
		
		[Test(description="text field uses body font family")]
		public function test_text_field_uses_body_font_family( ) : void
		{
			textField.htmlText = "<body>Hello!</body>";
			
			var textFormat : TextFormat = textField.getTextFormat( 1, 2 );
			
			assertThat( textFormat.font, equalTo( 'Helvetica Neue' ) );
		}
		
		[Test(description="text field uses body color")]
		public function test_text_field_uses_body_color( ) : void
		{
			textField.htmlText = "<body>Hello!</body>";
			
			var textFormat : TextFormat = textField.getTextFormat( 1, 2 );
			
			assertThat( textFormat.color, equalTo( 0x32DAFF ) );
		}
		
		[Test(description="text field uses header decoration")]
		public function test_text_field_uses_header_decoration( ) : void
		{
			textField.htmlText = "<header>Hello!</header>";
			
			var textFormat : TextFormat = textField.getTextFormat( 1, 2 );
			
			assertThat( textFormat.underline, isTrue( ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function TextFieldFixture( )
		{
		}
	
	}

}
