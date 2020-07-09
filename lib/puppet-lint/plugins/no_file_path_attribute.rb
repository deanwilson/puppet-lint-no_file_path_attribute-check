PuppetLint.new_check(:no_file_path_attribute) do

  def check
    resource_indexes.each do |resource|
      next unless resource[:type].value == 'file'

      param_tokens = resource[:param_tokens].select { |pt| pt.value == 'path' }

      param_tokens.each do |param_token|
        value_token = param_token.next_code_token.next_code_token

        notify :warning, {
          message: 'file resources should not have a path attribute. Use the title instead',
          line: value_token.line,
          column: value_token.column,
          token: value_token,
        }
      end
    end
  end
end
