require 'spec_helper.rb'
require_relative '../lib/module_errors.rb'

RSpec.describe Errors do
  include Errors
  let(:f_index) { 1 }
  let(:correct_format_string) { '  font-size: 14px;' }

  describe '#after_colon_space_error?' do
    context 'returns true with error message if there is no space after colon' do
      f_string = '  font-size:14px;'
      it { expect(after_colon_space_error?(f_string, f_index)).to eql(true) }
    end
    context 'returns no error message if there is a space after colon' do
      it { expect(after_colon_space_error?(correct_format_string, f_index)).not_to eql(true) }
    end
  end

  describe '#before_colon_space_error?' do
    context 'returns true with error message if there is a space before colon' do
      f_string = '  font-size :14px;'
      it { expect(before_colon_space_error?(f_string, f_index)).to eql(true) }
    end
    context 'returns no error message if there is a no space before colon' do
      it { expect(before_colon_space_error?(correct_format_string, f_index)).not_to eql(true) }
    end
  end

  describe '#white_trailing_space_error?' do
    context 'returns false with error message if there is a trailing white space' do
      f_string = 'body {   '
      it { expect(white_trailing_space_error?(f_string, f_index)).not_to eql(true) }
    end
  end

  describe '#indentation_error?' do
    context 'returns true with error message if there is no indentation of properties' do
      f_string = 'font-size: 14px;'
      it { expect(indentation_error?(f_string, f_index)).to eql(true) }
    end
    context 'returns no error message if there is intdentation' do
      it { expect(indentation_error?(correct_format_string, f_index)).not_to eql(true) }
    end
  end

  describe '#space_before_brace_error?' do
    context 'returns true with error message if there is no space before brace' do
      f_string = 'body{'
      it { expect(space_before_brace_error?(f_string, f_index)).to eql(true) }
    end
    context 'returns no error message if there is a space before brace' do
      f_string = 'body {'
      it { expect(space_before_brace_error?(f_string, f_index)).not_to eql(true) }
    end
  end

  describe '#missing_ending_semicolon_error?' do
    context 'returns false with error message if there is no ending semicolon after defining property and value' do
      f_string = 'font-size: 23px '
      it { expect(missing_ending_semicolon_error?(f_string, f_index)).not_to eql(true) }
    end
  end

  describe '#space_before_semicolon_error?' do
    context 'returns true with error message if there is a space before semicolon' do
      f_string = 'font-size: 40px ;'
      it { expect(space_before_semicolon_error?(f_string, f_index)).to eql(true) }
    end
    context 'returns no error message if there is no space before semicolon' do
      f_string = 'body {'
      it { expect(space_before_semicolon_error?(f_string, f_index)).not_to eql(true) }
    end
  end
end
