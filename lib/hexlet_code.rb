# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/form_builder"

# Form generator
module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload(:FormBuilder, "../lib/hexlet_code/form_builder")
  autoload(:Tag, "../lib/hexlet_code/tag")
  autoload(:Submit, "../lib/hexlet_code/submit")
  autoload(:Input, "../lib/hexlet_code/input")

  def self.form_for(entity, opts = {}, &block)
    FormBuilder.new(entity, opts).build(&block)
  rescue Error
    HexletCode::Error
  end
end
