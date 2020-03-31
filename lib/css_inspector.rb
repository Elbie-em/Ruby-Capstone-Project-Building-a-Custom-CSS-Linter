require 'strscan'
require 'colorize'
class CSSInspectorTool
  attr_reader :file_details

  def initialize(file_details_arr)
    @file_details_array = file_details_arr
  end

  
  def after_colon_space_error?(f_string,f_index)
    if f_string.match?(/(:\w+)/)
      puts ' NoSpacAfterColonError'.red + ': no space after colon ":" at' + " line:[:#{f_index}:]".yellow
    else
      return
    end
  end
  def before_colon_space_error?(f_string,f_index)
    if f_string.match?(/( :)/)
      puts ' SpaceBeforeColonError'.red + ': space before colon " :" at' + " line:[:#{f_index}:]".yellow
    else
      return
    end
  end

  def inspect_file
    @file_details_array.each_with_index do |f_string,f_index|
      after_colon_space_error?(f_string,f_index + 1)
      before_colon_space_error?(f_string,f_index + 1)
    end
  end


  
end