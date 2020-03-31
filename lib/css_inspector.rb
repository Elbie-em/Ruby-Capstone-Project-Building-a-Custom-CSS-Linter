require 'strscan'
require 'colorize'
class CSSInspectorTool
  attr_reader :file_details

  def initialize(file_details_arr)
    @file_details_array = file_details_arr
  end

  
  def after_colon_space_error?(f_string,f_index)
    if f_string.match?(/(:\w+)/)
      puts 'ⓧ NoSpacAfterColonError'.red + ': css(no space after colon ":") on'.cyan + " line:[:#{f_index}:]".yellow
    else
      return
    end
  end

  def before_colon_space_error?(f_string,f_index)
    if f_string.match?(/( :)/)
      puts 'ⓧ SpaceBeforeColonError'.red + ': css(space before colon) " :" on'.cyan + " line:[:#{f_index}:]".yellow
    else
      return
    end
  end

  def white_trailing_space_error?(f_string,f_index)
    if f_string.match?(/([^\s]\n)$/) || f_string.match?(/^\n$/)
      return
    else
      puts 'ⓧ WhiteTrailingSpaceError'.red + ': css(trailing white space) on'.cyan + " line:[:#{f_index}:]".yellow
    end
  end

  def indentation_error?(f_string,f_index)
    if f_string.match?(/^\w+\s*-.\w*:/) || f_string.match?(/^\w+\s*\w*:/)
      puts 'ⓧ IndentationError'.red + ': css(two spaced indentation required) on'.cyan + " line:[:#{f_index}:]".yellow
    else
      return
    end
  end

  def space_before_brace_error(f_string,f_index)
    if f_string.match?(/\w+{$/)
      puts 'ⓧ NoSpaceBeforeBrace'.red + ': css(no space before opening brace "{" ) on'.cyan + " line:[:#{f_index}:]".yellow
    end
  end

  def missing_ending_semicolon_error(f_string,f_index)
    if f_string.match?(/(;.*)$/) || f_string.match?(/({|})/) || f_string.match?(/^\n$/)
      return
    else
      puts 'ⓧ MissingEndingSemiColonError'.red + ': css(ending semicolon ";" expected) on'.cyan + " line:[:#{f_index}:]".yellow
    end
  end

  def inspect_file
    @file_details_array.each_with_index do |f_string,f_index|
      after_colon_space_error?(f_string,f_index + 1)
      before_colon_space_error?(f_string,f_index + 1)
      white_trailing_space_error?(f_string,f_index + 1)
      indentation_error?(f_string,f_index + 1)
      space_before_brace_error(f_string,f_index + 1)
      missing_ending_semicolon_error(f_string,f_index + 1)
      
    end
  end


  
end