# frozen_string_literal: true

# Form generator
module HexletCode
  autoload(:FormBuilder, "hexlet_code/form_builder")
  autoload(:Input, "hexlet_code/form_builder")
  autoload(:Submit, "hexlet_code/form_builder")
  autoload(:Tag, "hexlet_code/form_builder")
  autoload(:VERSION, "hexlet_code/version")

  class Error < StandardError; end
  # Your code goes here...

  def self.form_for(entity, opts = {}, &block)
    FormBuilder.new(entity, opts).build(&block)
  rescue Error
    HexletCode::Error
  end
end
