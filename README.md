# Sass4as

Syntactially Awesome Stylesheets for ActionScript 3, a scaled-back [Sass](http://sass-lang.com) parser for AS3.

Using CSS to externally define styles in Flash applications is a **good practice**. But in projects that have designs and clients that change and increase in complexity frequently, they become very hard to maintain and update and quickly turn into style soup.

## Enter Sass

[Sass](http://sass-lang.com) rocks. Hard. It's a new way of writing CSS, letting you use variables, selector inheritance, mixins, and helper methods to super-charge your stylesheets, all while generally reducing filesize and increasing readability.

The Sass4as project is a parser for Sass documents that converts them to native Flash StyleSheet objects. Similar to how Flash's HTML parser does not support every facet of CSS, like descendant selectors, Sass4as does not support every facet of Sass, like descendant selectors.

The goal is to support every single awesome thing Sass does that makes sense in Flash.

## How to use the SassParser

Given the stylesheet below...

	/* css/site.sass */
	$bold: Helvetica Neue LT Std 85 Heavy
	$blue: #001bf8
	
	base
	  font-family: $bold
	  color: $blue
	
	header
	  @extend base
	  font-size: 24pt
	
	body
	  @extend base
	  font-size: 14pt

... loaded into a variable called sass:String.

	import com.jeremyruppel.sass4as.parser.SassParser;
	
	var parser : SassParser = new SassParser( );
	
	var styleSheet : StyleSheet = parser.parseSass( sass );
	
	trace( styleSheet.styleNames ); // => base, header, body
	trace( styleSheet.getStyle( 'body' ).fontFamily ) // => Helvetica Neue LT Std 85 Heavy

And there you go. Apply that sucker to your TextFields and get to work.

The default SassParser implementation also retains style definitions, so you can combine multiple stylesheets into one StyleSheet instance. *Think of the benefits for localization!*

## The Basics of Sass4as

**No curly braces**
  
Sass is an indentation-based language, so selector declarations do not need to be bound by curly braces
  
**No semicolons**

For the same reason, attribute declarations do not need to end with semicolons

**No tabs**

To set a standard for indentation, selectors are declared at the start of a line and attributes are declared by inserting exactly two spaces.

**No .class or #id selectors**

Taking advantage of Flash's loose HTML parser, styles should be declared by implicit class. Meaning:

Bad:
	
	.highlight
	  color: #ff00ff
	
	<span class="highlight">Text</span>

Good:

	highlight
	  color: #ff00ff
	
	<highlight>Text</highlight>
	
The use of implicit style classes greatly enhances readability in your markup.

The [Sass4as TextMate Bundle](http://github.com/jeremyruppel/sass4as-tmbundle) has syntax highlighting and a few useful commands to help out while editing .sass documents.

## Variables

In sass documents, you can declare variables and reference them later in your document.

	$black: $121212
	$font: Helvetica Neue
	
	header
	  color: $black
	  font-family: $font
	  font-size: 24pt
	
	body
	  color: $black
	  font-family: $font
	  font-size: 14pt

**Note: A variable must be declared ahead of any reference to it in the document**

## Selector Inheritance

In sass documents, you can easily extend classes with the `@extend` directive. Attributes are assigned in order, so you can overwrite them if you wish.

	font-base
	  color: #121212
	  font-family: Helvetica Neue
	  font-size: 12pt
	  display: inline
	
	header
	  @extend font-base
	  font-size: 24pt
	
	body
	  @extend font-base

**Note: A class must be declared ahead of any reference to it in the document**

You can also declare the star "*" selector and all subsequent classes will inherit from it automatically.

	*
	  display: inline
	  font-family: Helvetica Neue
	
	header
	  font-size: 24pt
	
	body
	  font-size: 12pt

## Mixins

**Mixins are not yet supported by the Sass4as parser, but they're in the works**

## Helper Methods

**Helper methods are not yet supported by the Sass4as parser, but they're in the works**

## Other Notes

Block-style comments are not yet supported. Single-line comments work, though.