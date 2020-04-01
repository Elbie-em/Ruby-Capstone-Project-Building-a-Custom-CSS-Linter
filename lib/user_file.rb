class UserFile
  attr_reader :user_file_path

  def initialize(file_path)
    @user_file_path = file_path
  end

  def read_file_elements(_user_file_path)
    user_file = File.open(@user_file_path)
    user_file_details = user_file.readlines
    user_file.close
    user_file_details
  end
end
