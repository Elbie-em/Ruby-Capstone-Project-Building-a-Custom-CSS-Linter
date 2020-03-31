require 'strscan'
require 'colorize'
class CSSInspectorTool
  attr_reader :file_details

  def initialize(file_details_arr)
    @file_details_array = file_details_arr
  end

  
  def after_colon_space_error?(f_string,f_index)
    if f_string.match?(/(:\w+)/)
      puts ' NoSpacAfterColonError'.red + ': no space after colon ":" on' + " line:[:#{f_index}:]".yellow
    else
      return
    end
  end

  def before_colon_space_error?(f_string,f_index)
    if f_string.match?(/( :)/)
      puts ' SpaceBeforeColonError'.red + ': space before colon " :" on' + " line:[:#{f_index}:]".yellow
    else
      return
    end
  end

  def white_trailing_space_error?(f_string,f_index)
    if f_string.match?(/([^\s]\n)$/) || f_string.match?(/^\n$/)
      return
    else
      puts ' WhiteTrailingSpaceError'.red + ': trailing white space on' + " line:[:#{f_index}:]".yellow
    end
  end

  def inspect_file
    @file_details_array.each_with_index do |f_string,f_index|
      after_colon_space_error?(f_string,f_index + 1)
      before_colon_space_error?(f_string,f_index + 1)
      white_trailing_space_error?(f_string,f_index + 1)
    end
  end


  
end