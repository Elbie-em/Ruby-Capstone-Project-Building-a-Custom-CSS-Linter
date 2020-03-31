# importing users file for command line interface

user_file_path = ARGV

user_file_path = user_file_path.shift

puts "Checking '#{user_file_path}' for errors..."

user_file = File.open(user_file_path)

user_file_details = user_file.readlines

puts user_file_details