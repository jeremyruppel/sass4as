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
	public class ExtendOperationFixture
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
	
		[Test(description="extend operation imports attributes from a previously defined class")]
		public function test_extend_operation_imports_attributes_from_a_previously_defined_class( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue

header
  @extend body
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'header' ), hasProperty( 'fontFamily', equalTo( 'Helvetica Neue' ) ) );
		}
		
		[Test(description="classes can inherit from multiple superclasses")]
		public function test_classes_can_inherit_from_multiple_superclasses( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue

theme
  color: #00ff00

header
  @extend body
  @extend theme
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'header' ), hasProperties( { fontFamily : equalTo( 'Helvetica Neue' ), color : equalTo( '#00ff00' ) } ) );
		}
		
		[Test(description="classes can inherit from multiple levels of ancestors")]
		public function test_classes_can_inherit_from_multiple_levels_of_ancestors( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue

theme
  @extend body
  color: #00ff00

header
  @extend theme
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'header' ), hasProperties( { fontFamily : equalTo( 'Helvetica Neue' ), color : equalTo( '#00ff00' ) } ) );
		}
		
		[Test(description="extensions can be overwritten")]
		public function test_extensions_can_be_overwritten( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
body
  font-family: Helvetica Neue
  font-size: 12pt
  color: #ff0000

h1
  @extend body
  font-size: 20pt
]]>
</sass>;

			var styleSheet : StyleSheet = parser.parseSass( sass.toString( ) );

			assertThat( styleSheet.getStyle( 'h1' ), hasProperties( { fontSize : equalTo( 20 ), fontFamily : equalTo( 'Helvetica Neue' ), color : equalTo( '#ff0000' ) } ) );
		}

		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function ExtendOperationFixture( )
		{
		}

	}

}
