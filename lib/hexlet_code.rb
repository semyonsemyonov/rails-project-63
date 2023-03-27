# frozen_string_literal: true

# Form generator
module HexletCode
  autoload(:FormBuilder, "../lib/hexlet_code/form_builder")
  autoload(:Input, "../lib/hexlet_code/form_builder")
  autoload(:Submit, "../lib/hexlet_code/form_builder")
  autoload(:Tag, "../lib/hexlet_code/form_builder")
  autoload(:VERSION, "../lib/hexlet_code/version")

  class Error < StandardError; end
  # Your code goes here...

  def self.form_for(entity, opts = {}, &block)
    FormBuilder.new(entity, opts).build(&block)
  rescue Error
    HexletCode::Error
  end
end
