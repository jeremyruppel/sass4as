//AS3///////////////////////////////////////////////////////////////////////////
// 
// Copyright (c) 2010 the original author or authors
//
// Permission is hereby granted to use, modify, and distribute this file
// in accordance with the terms of the license agreement accompanying it.
// 
////////////////////////////////////////////////////////////////////////////////

package com.jeremyruppel.sass4as
{
	import com.jeremyruppel.sass4as.operation.AttributeOperationFixture;
	import com.jeremyruppel.sass4as.operation.AttributeOperationPatternFixture;
	import com.jeremyruppel.sass4as.operation.CatchAllOperationFixture;
	import com.jeremyruppel.sass4as.operation.CatchAllOperationPatternFixture;
	import com.jeremyruppel.sass4as.operation.CommentOperationFixture;
	import com.jeremyruppel.sass4as.operation.CommentOperationPatternFixture;
	import com.jeremyruppel.sass4as.operation.EmptyOperationFixture;
	import com.jeremyruppel.sass4as.operation.EmptyOperationPatternFixture;
	import com.jeremyruppel.sass4as.operation.ExtendOperationFixture;
	import com.jeremyruppel.sass4as.operation.ExtendOperationPatternFixture;
	import com.jeremyruppel.sass4as.operation.GlobalOperationFixture;
	import com.jeremyruppel.sass4as.operation.GlobalOperationPatternFixture;
	import com.jeremyruppel.sass4as.operation.StyleOperationFixture;
	import com.jeremyruppel.sass4as.operation.StyleOperationPatternFixture;
	import com.jeremyruppel.sass4as.operation.VariableOperationFixture;
	import com.jeremyruppel.sass4as.operation.VariableOperationPatternFixture;
	import com.jeremyruppel.sass4as.parser.HolyGrailFixture;
	import com.jeremyruppel.sass4as.parser.SassParserFixture;
	import com.jeremyruppel.sass4as.parser.TextFieldFixture;
	import com.jeremyruppel.sass4as.util.CamelCaseFixture;
	import com.jeremyruppel.sass4as.util.CssValueFixture;
	import com.jeremyruppel.sass4as.util.StripFixture;

	/**
	 * The sass4as project aims to provide a SASS parser for as3.
	 * SASS is better than CSS, it's a more programmatic view of styles
	 * and allows for inheritance, variables, mixins, and helper functions.
	 * 
	 * Nesting styles is not supported by the Flash HTML engine anyhow,
	 * so it doesn't really make sense to support it in the sass4as engine.
	 * 
	 * TODO:
	 * 
	 * - helper functions
	 * - math operations
	 * - mixins
	 * - mimic demos from sass-lang.org
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  18.08.2010
	 */
	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class Sass4ASTestSuite
	{
		//--------------------------------------
		//  FIXTURES
		//--------------------------------------
		
		// sass4as.operation                        : unit tests for operation executions and patterns
		public var attributeOperationFixture        : AttributeOperationFixture
		public var attributeOperationPatternFixture : AttributeOperationPatternFixture;
		public var catchAllOperationFixture         : CatchAllOperationFixture;
		public var catchAllOperationPatternFixture  : CatchAllOperationPatternFixture;
		public var commentOperationFixture          : CommentOperationFixture;
		public var commentOperationPatternFixture   : CommentOperationPatternFixture;
		public var emptyOperationFixture            : EmptyOperationFixture;
		public var emptyOperationPatternFixture     : EmptyOperationPatternFixture;
		public var extendOperationFixture           : ExtendOperationFixture;
		public var extendOperationPatternFixture    : ExtendOperationPatternFixture;
		public var globalOperationFixture           : GlobalOperationFixture;
		public var globalOperationPatternFixture    : GlobalOperationPatternFixture;
		public var styleOperationFixture            : StyleOperationFixture;
		public var styleOperationPatternFixture     : StyleOperationPatternFixture;
		public var variableOperationFixture         : VariableOperationFixture;
		public var variableOperationPatternFixture  : VariableOperationPatternFixture;
		
		// sass4as.parser                           : unit tests for the sass parser
		public var sassParserFixture                : SassParserFixture;
		public var holyGrailFixture                 : HolyGrailFixture;
		public var textFieldFixture                 : TextFieldFixture;
		
		// sass4as.util                             : unit tests for helper functions
		public var camelCaseFixture                 : CamelCaseFixture;
		public var cssValueFixture                  : CssValueFixture;
		public var stripFixture                     : StripFixture;
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function Sass4ASTestSuite( )
		{
		}
	
	}

}
