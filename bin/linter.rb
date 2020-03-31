require './lib/user_file.rb'

# importing users file for command line interface

user_file_path = ARGV

user_file_path = user_file_path.shift

puts "Checking '#{user_file_path}' for errors..."

user_file = UserFile.new(user_file_path)

user_file_details = user_file.read_file_elements(user_file)

print user_file_details

