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
	import com.jeremyruppel.sass4as.context.StyleContext;
	import com.jeremyruppel.sass4as.core.ISassParser;
	import com.jeremyruppel.sass4as.parser.SassParser;
	import flash.text.StyleSheet;
	import org.hamcrest.assertThat;
	import org.hamcrest.collection.arrayWithSize;
	import org.hamcrest.core.isA;
	import org.hamcrest.object.equalTo;
	import org.hamcrest.object.nullValue;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 9.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  24.08.2010
	 */
	public class GlobalOperationFixture
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
	
		[Test(description="global operation operates on the parsers global context")]
		public function test_global_operation_operates_on_the_parsers_global_context( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
*
  color: #ff0000
]]>
</sass>;

			parser.parseSass( sass.toString( ) );

			assertThat( parser.context, equalTo( parser.globalContext ) );
		}
		
		[Test(description="global context is actually a style context")]
		public function test_global_context_is_actually_a_style_context( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
*
  color: #ff0000
]]>
</sass>;

			parser.parseSass( sass.toString( ) );

			assertThat( parser.globalContext, isA( StyleContext ) );
		}
		
		[Test(description="global context does not appear in the stylesheets style collection")]
		public function test_global_context_does_not_appear_in_the_stylesheets_style_collection( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
*
  color: #ff0000
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.styleNames, arrayWithSize( 0 ) );
		}
		
		[Test(description="global operation adds attributes to the global context")]
		public function test_global_operation_adds_attributes_to_the_global_context( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
*
  color: #ff0000
]]>
</sass>;

			parser.parseSass( sass.toString( ) );

			assertThat( parser.globalContext.attributes.length, equalTo( 1 ) );
			
			assertThat( parser.globalContext.attributes[ 0 ].name, equalTo( 'color' ) );
		}
		
		[Test(description="all styles declared after global style automatically inherit from it")]
		public function test_all_styles_declared_after_global_style_automatically_inherit_from_it( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
*
  color: #ff0000

header
  font-size: 24pt
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'header' ).color, equalTo( '#ff0000' ) );
		}
		
		[Test(description="styles declared before the global style do not inherit from it")]
		public function test_styles_declared_before_the_global_style_do_not_inherit_from_it( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
header
  font-size: 24pt

*
  color: #ff0000

body
  font-size: 14pt
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'body' ).color, equalTo( '#ff0000' ) );
			
			assertThat( styleSheet.getStyle( 'header' ).color, nullValue( ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function GlobalOperationFixture( )
		{
		}
	
	}

}
