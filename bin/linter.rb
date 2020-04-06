#!/usr/bin/env ruby
require_relative './lib/user_file.rb'
require_relative './lib/css_inspector.rb'

puts 'Checking File for errors...'
puts

user_file_path = ARGV

user_file_path = user_file_path.shift

user_file = UserFile.new(user_file_path)

user_file_details = user_file.read_file_elements(user_file)

inspector_tool = CSSInspectorTool.new(user_file_details)

inspector_tool.inspect_file
