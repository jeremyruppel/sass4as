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
	import com.jeremyruppel.sass4as.parser.SassParser;
	import flash.text.StyleSheet;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.hasItem;
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
	public class HolyGrailFixture
	{
		//--------------------------------------
		//  CLASS CONSTANTS
		//--------------------------------------
		
		private const holygrail : XML =
<holygrail>
<![CDATA[
$font: Helvetica Neue
$black: #111111
$blue: #1B8AFF

h1
  font-family: $font
  font-size: 24pt
  color: $black

body
  font-family: $font
  font-size: 14pt
  leading: 2px
  color: $black

link
  @extend body
  color: $blue

]]>
</holygrail>;

		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------

		private var styleSheet : StyleSheet;
		
		//--------------------------------------
		//  SETUP
		//--------------------------------------
		
		[Before]
		public function setup( ) : void
		{
			var parser : ISassParser = new SassParser( );
			
			styleSheet = parser.parseSass( holygrail.toString( ) );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
	
		[Test(description="holy grail yields h1 style")]
		public function test_holy_grail_yields_h1_style( ) : void
		{
			assertThat( styleSheet.styleNames, hasItem( 'h1' ) );
		}
		
		[Test(description="holy grail yields h1 style with correct font family")]
		public function test_holy_grail_yields_h1_style_with_correct_font_family( ) : void
		{
			assertThat( styleSheet.getStyle( 'h1' ).fontFamily, equalTo( "Helvetica Neue" ) );
		}
		
		[Test(description="holy grail yields h1 style with correct font size")]
		public function test_holy_grail_yields_h1_style_with_correct_font_size( ) : void
		{
			assertThat( styleSheet.getStyle( 'h1' ).fontSize, equalTo( 24 ) );
		}
		
		[Test(description="holy grail yields h1 style with correct color")]
		public function test_holy_grail_yields_h1_style_with_correct_color( ) : void
		{
			assertThat( styleSheet.getStyle( 'h1' ).color, equalTo( '#111111' ) );
		}
		
		[Test(description="holy grail yields body style")]
		public function test_holy_grail_yields_body_style( ) : void
		{
			assertThat( styleSheet.styleNames, hasItem( 'body' ) );
		}
		
		[Test(description="holy grail yields body style with correct font family")]
		public function test_holy_grail_yields_body_style_with_correct_font_family( ) : void
		{
			assertThat( styleSheet.getStyle( 'body' ).fontFamily, equalTo( "Helvetica Neue" ) );
		}
		
		[Test(description="holy grail yields body style with correct font size")]
		public function test_holy_grail_yields_body_style_with_correct_font_size( ) : void
		{
			assertThat( styleSheet.getStyle( 'body' ).fontSize, equalTo( 14 ) );
		}
		
		[Test(description="holy grail yields body style with correct leading")]
		public function test_holy_grail_yields_body_style_with_correct_leading( ) : void
		{
			assertThat( styleSheet.getStyle( 'body' ).leading, equalTo( 2 ) );
		}
		
		[Test(description="holy grail yields body style with correct color")]
		public function test_holy_grail_yields_body_style_with_correct_color( ) : void
		{
			assertThat( styleSheet.getStyle( 'body' ).color, equalTo( '#111111' ) );
		}
		
		[Test(description="holy grail yields link style")]
		public function test_holy_grail_yields_link_style( ) : void
		{
			assertThat( styleSheet.styleNames, hasItem( 'link' ) );
		}
		
		[Test(description="holy grail yields link style with correct font family")]
		public function test_holy_grail_yields_link_style_with_correct_font_family( ) : void
		{
			assertThat( styleSheet.getStyle( 'link' ).fontFamily, equalTo( "Helvetica Neue" ) );
		}
		
		[Test(description="holy grail yields link style with correct font size")]
		public function test_holy_grail_yields_link_style_with_correct_font_size( ) : void
		{
			assertThat( styleSheet.getStyle( 'link' ).fontSize, equalTo( 14 ) );
		}
		
		[Test(description="holy grail yields link style with correct leading")]
		public function test_holy_grail_yields_link_style_with_correct_leading( ) : void
		{
			assertThat( styleSheet.getStyle( 'link' ).leading, equalTo( 2 ) );
		}
		
		[Test(description="holy grail yields link style with correct color")]
		public function test_holy_grail_yields_link_style_with_correct_color( ) : void
		{
			assertThat( styleSheet.getStyle( 'link' ).color, equalTo( '#1B8AFF' ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function HolyGrailFixture( )
		{
		}
	
	}

}
