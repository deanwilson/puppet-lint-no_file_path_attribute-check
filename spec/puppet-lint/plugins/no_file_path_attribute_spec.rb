require 'spec_helper'

describe 'no_file_path_attribute' do
  let(:msg) { 'file resources should not have a path attribute. Use the title instead' }

  context 'file with a full path title' do
    let(:code) do
      <<-EXAMPLE_CLASS
        class good_namevar {
          file { '/tmp/good_namevar':
            content => 'Good namevar',
          }
        }
      EXAMPLE_CLASS
    end

    it 'does not detect any problems' do
      expect(problems).to have(0).problems
    end
  end

  context 'file with path attribute' do
    let(:code) do
      <<-EXAMPLE_CLASS
        class path_attribute {
          file { 'bad_namevar':
            path => '/tmp/bad_path_attr',
          }
        }
      EXAMPLE_CLASS
    end

    it 'detects a single problem' do
      expect(problems).to have(1).problem
    end

    it 'creates a warning' do
      expect(problems).to contain_warning(msg).on_line(3).in_column(21)
    end
  end
end
