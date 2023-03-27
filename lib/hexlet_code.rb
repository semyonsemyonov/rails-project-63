# frozen_string_literal: true

# Form generator
module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:Input, 'hexlet_code/input')
  autoload(:Submit, 'hexlet_code/submit')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:VERSION, 'hexlet_code/version')

  class Error < StandardError; end
  # Your code goes here...

  def self.form_for(entity, opts = {}, &)
    FormBuilder.new(entity, opts).build(&)
  rescue Error
    HexletCode::Error
  end
end
