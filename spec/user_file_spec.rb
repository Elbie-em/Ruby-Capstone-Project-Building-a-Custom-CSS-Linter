require 'spec_helper.rb'
require'./lib/user_file.rb'

RSpec.describe UserFile do
  let(:user_file) { UserFile.new('./files/stylesheet.css') }

  describe '#initialize' do
    context 'declares path of the file we want to inspect' do
      it { expect(user_file.user_file_path).to eql('./files/stylesheet.css') }
    end
  end

  describe '.read_file_elements' do
    context 'opens the file and traverses through its content returning an array of content' do
      it { expect(user_file.read_file_elements(user_file).class).to eql(Array) }
    end
  end
end
