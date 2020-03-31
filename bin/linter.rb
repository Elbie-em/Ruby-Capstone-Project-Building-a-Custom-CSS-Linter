require './lib/user_file.rb'
require '/lib/css_inspector.rb'

# importing users file for command line interface

user_file_path = ARGV

user_file_path = user_file_path.shift

puts "Checking '#{user_file_path}' for errors..."

user_file = UserFile.new(user_file_path)

user_file_details = user_file.read_file_elements(user_file)

inspector_tool = CSSInspectorTool.new(user_file_details)

