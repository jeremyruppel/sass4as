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
	import com.jeremyruppel.sass4as.operation.AttributeOperation;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.not;
	import org.hamcrest.object.equalTo;
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
	public class AttributeOperationPatternFixture
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
			operation = new AttributeOperation( );
		}
		
		//--------------------------------------
		//  TEST CASES
		//--------------------------------------
		
		/*
		 * color
		 * display
		 * font-family
		 * font-size
		 * font-style
		 * font-weight
		 * kerning
		 * leading
		 * letter-spacing
		 * margin-left
		 * margin-right
		 * text-align
		 * text-decoration
		 * text-indent
		 */
		
		[Test(description="attribute operation pattern matches valid attribute declaration")]
		public function test_attribute_operation_pattern_matches_valid_attribute_declaration( ) : void
		{
			assertThat( "  color: #ff0022", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern does not match declaration not preceded by two spaces")]
		public function test_attribute_operation_pattern_does_not_match_declaration_not_preceded_by_two_spaces( ) : void
		{
			assertThat( " color: #ff0022", not( re( operation.pattern ) ) );
			assertThat( "color: #ff0022", not( re( operation.pattern ) ) );
		}
		
		[Test(description="attribute operation pattern matches color attribute")]
		public function test_attribute_operation_pattern_matches_color_attribute( ) : void
		{
			assertThat( "  color: #ff0022", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches display attribute")]
		public function test_attribute_operation_pattern_matches_display_attribute( ) : void
		{
			assertThat( "  display: inline", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches font family attribute")]
		public function test_attribute_operation_pattern_matches_font_family_attribute( ) : void
		{
			assertThat( "  font-family: Helvetica Neue", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches font size attribute")]
		public function test_attribute_operation_pattern_matches_font_size_attribute( ) : void
		{
			assertThat( "  font-size: 12pt", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches font style attribute")]
		public function test_attribute_operation_pattern_matches_font_style_attribute( ) : void
		{
			assertThat( "  font-style: italic", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches font weight attribute")]
		public function test_attribute_operation_pattern_matches_font_weight_attribute( ) : void
		{
			assertThat( "  font-weight: bold", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches kerning attribute")]
		public function test_attribute_operation_pattern_matches_kerning_attribute( ) : void
		{
			assertThat( "  kerning: 10pt", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches leading attribute")]
		public function test_attribute_operation_pattern_matches_leading_attribute( ) : void
		{
			assertThat( "  leading: 5pt", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches letter spacing attribute")]
		public function test_attribute_operation_pattern_matches_letter_spacing_attribute( ) : void
		{
			assertThat( "  letter-spacing: 2pt", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches margin left attribute")]
		public function test_attribute_operation_pattern_matches_margin_left_attribute( ) : void
		{
			assertThat( "  margin-left: 10px", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches margin right attribute")]
		public function test_attribute_operation_pattern_matches_margin_right_attribute( ) : void
		{
			assertThat( "  margin-right: 20px", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches text align attribute")]
		public function test_attribute_operation_pattern_matches_text_align_attribute( ) : void
		{
			assertThat( "  text-align: center", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches text decoration attribute")]
		public function test_attribute_operation_pattern_matches_text_decoration_attribute( ) : void
		{
			assertThat( "  text-decoration: underline", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern matches text indent attribute")]
		public function test_attribute_operation_pattern_matches_text_indent_attribute( ) : void
		{
			assertThat( "  text-indent: 5px", re( operation.pattern ) );
		}
		
		[Test(description="attribute operation pattern doesnt match anything else")]
		public function test_attribute_operation_pattern_doesnt_match_anything_else( ) : void
		{
			assertThat( "  fake: center", not( re( operation.pattern ) ) );
		}
		
		[Test(description="attribute operation pattern captures the attribute name")]
		public function test_attribute_operation_pattern_captures_the_attribute_name( ) : void
		{
			assertThat( operation.pattern.exec( "  color: #00ff33" )[ 1 ], equalTo( "color" ) );
		}
		
		[Test(description="attribute operation pattern captures the attribute value")]
		public function test_attribute_operation_pattern_captures_the_attribute_value( ) : void
		{
			assertThat( operation.pattern.exec( "  color: #00ff44" )[ 2 ], equalTo( "#00ff44" ) );
		}
		
		[Test(description="attribute operation pattern matches attributes utilizing variables")]
		public function test_attribute_operation_pattern_matches_attributes_utilizing_variables( ) : void
		{
			assertThat( "  color: $blue", re( operation.pattern ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function AttributeOperationPatternFixture( )
		{
		}
	
	}

}
