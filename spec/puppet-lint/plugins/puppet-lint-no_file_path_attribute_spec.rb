require 'spec_helper'

describe 'no_file_path_attribute' do

  let(:msg) { 'file resources should not have a path attribute. Use the title instead' }

  context 'file with a full path title' do
    let(:code) do
      <<-EOS
        class good_namevar {
          file { '/tmp/good_namevar':
            content => 'Good namevar',
          }
        }
      EOS
    end

    it 'should not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'file with path attribute' do
    let(:code) do
      <<-EOS
        class path_attribute {
          file { 'bad_namevar':
            path => '/tmp/bad_path_attr',
          }
        }
      EOS
    end

    it 'should detect a single problem' do
      expect(problems).to have(1).problem
    end

    it 'should create a warning' do
      expect(problems).to contain_warning(msg).on_line(3).in_column(21)
    end

  end

end
