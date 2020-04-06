require_relative 'spec_helper.rb'
require_relative '../lib/css_inspector.rb'
require_relative '../lib/user_file.rb'

RSpec.describe CSSInspectorTool do
  let(:user_file) { UserFile.new('./files/stylesheet.css') }
  let(:user_file_details) { user_file.read_file_elements(user_file) }
  let(:css_inspector) { CSSInspectorTool.new(user_file_details) }

  describe '#initialize' do
    context 'tool accepts array object of file detail array of elements from user file' do
      it { expect(css_inspector.file_details_array).to eql(user_file_details) }
    end
  end

  describe '.inspect_file' do
    context 'inspect the file to check for errors, returns true if check complete' do
      it { expect(css_inspector.inspect_file).to eql(true) }
    end
  end
end
