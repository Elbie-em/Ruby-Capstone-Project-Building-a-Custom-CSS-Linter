# importing users file for command line interface

user_file_path = ARGV

user_file_path = user_file_path.shift

user_file = File.open(user_file_path)

user_file.read