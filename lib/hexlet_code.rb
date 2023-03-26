# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/form_builder"

# Form generator
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  def self.form_for(entity, opts = {}, &block)
    FormBuilder.new(entity, opts).build(&block)
  rescue Error
    HexletCode::Error
  end
end
