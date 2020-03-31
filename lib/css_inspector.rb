require './lib/module_errors.rb'
require 'colorize'

class CSSInspectorTool
  include Errors
  attr_reader :file_details

  def initialize(file_details_arr)
    @file_details_array = file_details_arr
  end

  public
  def inspect_file
    @file_details_array.each_with_index do |f_string,f_index|
      after_colon_space_error?(f_string,f_index + 1)
      sleep(0.1)
      before_colon_space_error?(f_string,f_index + 1)
      sleep(0.1)
      white_trailing_space_error?(f_string,f_index + 1)
      sleep(0.1)
      indentation_error?(f_string,f_index + 1)
      sleep(0.1)
      space_before_brace_error?(f_string,f_index + 1)
      sleep(0.1)
      missing_ending_semicolon_error?(f_string,f_index + 1)  
      sleep(0.1)
      space_before_semicolon_error?(f_string,f_index + 1)
    end
  puts "File Check Complete".green
  end

end