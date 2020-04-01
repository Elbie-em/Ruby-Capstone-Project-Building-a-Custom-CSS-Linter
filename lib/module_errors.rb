# rubocop:disable Layout/LineLength
require 'strscan'
require 'colorize'

module Errors
  def after_colon_space_error?(f_string, f_index)
    return unless f_string.match?(/(:\w+)/)

    puts 'ⓧ NoSpacAfterColonError'.red + ': css(no space after colon ":") on'.cyan + " line:[:#{f_index}:]".yellow
  end

  def before_colon_space_error?(f_string, f_index)
    return unless f_string.match?(/( :)/)

    puts 'ⓧ SpaceBeforeColonError'.red + ': css(space before colon) " :" on'.cyan + " line:[:#{f_index}:]".yellow
  end

  def white_trailing_space_error?(f_string, f_index)
    if f_string.match?(/([^\s]\n)$/) || f_string.match?(/^\n$/)
      nil
    else
      puts 'ⓧ WhiteTrailingSpaceError'.red + ': css(trailing white space) on'.cyan + " line:[:#{f_index}:]".yellow
    end
  end

  def indentation_error?(f_string, f_index)
    return unless f_string.match?(/^\w+\s*-.\w*:/) || f_string.match?(/^\w+\s*\w*:/)

    puts 'ⓧ IndentationError'.red + ': css(two spaced indentation required) on'.cyan + " line:[:#{f_index}:]".yellow
  end

  def space_before_brace_error?(f_string, f_index)
    return unless f_string.match?(/\w+{$/)

    puts 'ⓧ NoSpaceBeforeBrace'.red + ': css(no space before opening brace "{" ) on'.cyan + " line:[:#{f_index}:]".yellow
  end

  def missing_ending_semicolon_error?(f_string, f_index)
    if f_string.match?(/(;.*)$/) || f_string.match?(/({|})/) || f_string.match?(/^\n$/)
      nil
    else
      puts 'ⓧ MissingEndingSemiColonError'.red + ': css(ending semicolon ";" expected) on'.cyan + " line:[:#{f_index}:]".yellow
    end
  end

  def space_before_semicolon_error?(f_string, f_index)
    return unless f_string.match?(/( ;)+/)

    puts 'ⓧ SpaceBeforeSemiColonError'.red + ': css(space before colon, no space expected) on'.cyan + " line:[:#{f_index}:]".yellow
  end
end

# rubocop:enable Layout/LineLength
