require './lib/css_inspector.rb'
require './lib/user_file.rb'


RSpec.describe CSSInspectorTool do
  let(:user_file) { UserFile.new('./files/stylesheet.css') }
  let(:user_file_details) {user_file.read_file_elements(user_file)}
  let(:css_inspector) {CSSInspectorTool.new(user_file_details)}

  describe '#initialize' do
    context 'tool accepts array object of file detail array of elements from user file' do
      it {expect(css_inspector.file_details_array).to eql(user_file_details)}
    end
  end
end
