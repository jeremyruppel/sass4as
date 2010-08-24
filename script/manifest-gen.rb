#!/usr/bin/env ruby -wKU

require "rubygems"
require "nokogiri"

Dir.chdir( '../src' ){
  File.open( 'sass4as-manifest.xml', 'w+' ) do |f|
    doc = Nokogiri::XML::Builder.new do |xml|
      xml.componentPackage {
        Dir.glob( '**/*.as' ).each do |uri|
          xml.component( :class => uri.gsub( '/', '.' ).sub( /\.as$/, '' ) )
        end
      }
    end
    f << doc.to_xml
  end
}
