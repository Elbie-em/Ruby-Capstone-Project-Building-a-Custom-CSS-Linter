require_relative 'module_errors.rb'
require 'colorize'

class CSSInspectorTool
  include Errors
  attr_reader :file_details_array

  def initialize(file_details_arr)
    @file_details_array = file_details_arr
  end

  def inspect_file
    @file_details_array.each_with_index do |f_string, f_index|
      after_colon_space_error?(f_string, f_index + 1)
      sleep(0.05)
      before_colon_space_error?(f_string, f_index + 1)
      sleep(0.05)
      white_trailing_space_error?(f_string, f_index + 1)
      sleep(0.05)
      indentation_error?(f_string, f_index + 1)
      sleep(0.05)
      space_before_brace_error?(f_string, f_index + 1)
      sleep(0.05)
      missing_ending_semicolon_error?(f_string, f_index + 1)
      sleep(0.05)
      space_before_semicolon_error?(f_string, f_index + 1)
    end
    puts
    puts 'File Check Complete'.green
    true
  end
end
