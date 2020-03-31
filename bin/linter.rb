require './lib/user_file.rb'
require './lib/css_inspector.rb'


puts "Checking File for errors..."

# importing users file for command line interface
user_file_path = ARGV

user_file_path = user_file_path.shift

user_file = UserFile.new(user_file_path)

# Creating array object of user file details line by line to pass to inspector tool
user_file_details = user_file.read_file_elements(user_file)

# Creating a user file inspector tool 
inspector_tool = CSSInspectorTool.new(user_file_details)

# File inspection
inspector_tool.inspect_file

