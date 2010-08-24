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
	import com.jeremyruppel.sass4as.context.NullContext;
	import com.jeremyruppel.sass4as.core.ISassContext;
	import com.jeremyruppel.sass4as.core.ISassOperation;
	import com.jeremyruppel.sass4as.core.ISassParser;
	import com.jeremyruppel.sass4as.core.ISassStyle;
	import com.jeremyruppel.sass4as.error.SassError;
	import com.jeremyruppel.sass4as.operation.AttributeOperation;
	import com.jeremyruppel.sass4as.operation.CatchAllOperation;
	import com.jeremyruppel.sass4as.operation.EmptyOperation;
	import com.jeremyruppel.sass4as.operation.ExtendOperation;
	import com.jeremyruppel.sass4as.operation.StyleOperation;
	import com.jeremyruppel.sass4as.operation.VariableOperation;
	import flash.text.StyleSheet;
	import flash.utils.Dictionary;

	/**
	 * Class.
	 * 
	 * @langversion ActionScript 3.0
	 * @playerversion Flash 10.0.0
	 * 
	 * @author Jeremy Ruppel
	 * @since  18.08.2010
	 */
	public class SassParser implements ISassParser
	{
		//--------------------------------------
		//  CONSTRUCTOR
		//--------------------------------------
	
		/**
		 * @constructor
		 */
		public function SassParser( )
		{
		}
	
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
	
		/**
		 * @private
		 */
		private var _operations : Vector.<ISassOperation>;
		
		/**
		 * @private
		 */
		private var _styles : Vector.<ISassStyle>;
		
		/**
		 * @private
		 */
		private var _context : ISassContext;
		
		/**
		 * @private
		 */
		private var _variables : Dictionary;
		
		/**
		 * @private
		 */
		private var _input : String;
		
		/**
		 * @private
		 */
		private var _cursor : int;
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		/**
		 * @return list of all of the available operations the parser can interpret
		 */
		public function get operations( ) : Vector.<ISassOperation>
		{
			return _operations || ( _operations = initialize( ) );
		}
		
		/**
		 * @return list of all of the styles defined in the stylesheet
		 */
		public function get styles( ) : Vector.<ISassStyle>
		{
			return _styles || ( _styles = new Vector.<ISassStyle>( ) );
		}
		
		/**
		 * @return the current context that the line parser assigns attributes to
		 */
		public function get context( ) : ISassContext
		{
			return _context || ( _context = new NullContext( ) );
		}
		
		/**
		 * @return dictionary all of the variables defined in the stylesheet
		 */
		public function get variables( ) : Dictionary
		{
			return _variables || ( _variables = new Dictionary( false ) );
		}
		
		/**
		 * @private stores the line currently being fed into the parser
		 */
		public function get input( ) : String
		{
			return _input;
		}
		
		/**
		 * @private stores the parser's cursor location
		 */
		public function get cursor( ) : int
		{
			return _cursor;
		}
		
		//--------------------------------------
		//  PUBLIC METHODS
		//--------------------------------------
	
		/**
		 * Parses sass text into a flash.text.StyleSheet
		 * 
		 * @param sass The sass text to parse into a StyleSheet
		 * @return StyleSheet 
		 */
		public function parseSass( sass : String ) : StyleSheet
		{
			sass.split( "\n" ).forEach( function( line : String, index : int, lines : Array ) : void
			{
				_input  = line;
				_cursor = index;
				
				operations.some( function( operation : ISassOperation, index : int, operations : Vector.<ISassOperation> ) : Boolean
				{
					if( operation.test( line ) )
					{
						_context = operation.execute( operation.pattern.exec( line ), this );
						
						return true;
					}
					
					return false;
					
				}, this );
				
			}, this );
			
			var styleSheet : StyleSheet = new StyleSheet( );
			
			styles.forEach( function( style : ISassStyle, index : int, styles : Vector.<ISassStyle> ) : void
			{
				styleSheet.setStyle( style.styleName, style.styleObject );
			} );
			
			return styleSheet;
		}
		
		/**
		 * Raises an error on behalf of an operation with information about where the error occurred
		 * 
		 * @param error The error to be raised
		 */
		public function raise( error : String ) : void
		{
			throw new SassError( "Exception raised at line " + cursor + ": " + error + " | Input: " + input );
		}
		
		//--------------------------------------
		//  PRIVATE & PROTECTED INSTANCE METHODS
		//--------------------------------------
		
		/**
		 * enables a default set of operations
		 * @private
		 * @return Vector 
		 */
		protected function initialize( ) : Vector.<ISassOperation>
		{
			var ops : Vector.<ISassOperation> = new Vector.<ISassOperation>( );
			
			ops.push( new EmptyOperation( ) );
			ops.push( new VariableOperation( ) );
			ops.push( new StyleOperation( ) );
			ops.push( new ExtendOperation( ) );
			ops.push( new AttributeOperation( ) );
			ops.push( new CatchAllOperation( ) );
			
			return ops;
		}
		
	}

}
