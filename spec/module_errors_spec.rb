require './lib/module_errors.rb'

RSpec.describe Errors do
  include Errors
  let(:f_index){1}

  describe '#after_colon_space_error?' do
    context 'returns error message if there is no space after colon' do
      f_string = '  font-size:14px;'
      it { expect(after_colon_space_error?(f_string, f_index)).to eql(true)}
    end
    context 'returns no error message if there is a space after colon' do
      f_string = '  font-size: 14px;'
      it { expect(after_colon_space_error?(f_string, f_index)).not_to eql(true)}
    end
  end
end