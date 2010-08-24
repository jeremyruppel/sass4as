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
	import com.jeremyruppel.sass4as.context.NullContext;
	import com.jeremyruppel.sass4as.core.ISassParser;
	import com.jeremyruppel.sass4as.parser.SassParser;
	import org.hamcrest.assertThat;
	import org.hamcrest.core.isA;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  19.08.2010
	 */
	public class CommentOperationFixture
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
	
		[Test(description="comment operation ignores a single line comment")]
		public function test_comment_operation_ignores_a_single_line_comment( ) : void
		{
			var sass : XML = 
<sass>
<![CDATA[
$blue: #49B1FF
/* this is a comment */
$red: #E52732
]]>
</sass>;

			assertThat( parser.context, isA( NullContext ) );
		}
		
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function CommentOperationFixture( )
		{
		}
		
	}

}
