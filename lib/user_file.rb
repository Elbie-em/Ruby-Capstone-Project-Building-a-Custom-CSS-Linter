class UserFile
  attr_reader :user_file_path

  def initialize(file_path)
    @user_file_path = file_path
  end

  public
  def read_file_elements(user_file_path)
    user_file = File.open(@user_file_path)
    user_file_details = user_file.readlines
    user_file.close
    return user_file_details
  end
end