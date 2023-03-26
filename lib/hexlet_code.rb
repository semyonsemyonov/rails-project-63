# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "form_builder"

# Form generator
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  def self.form_for(obj, opts = {})
    FormBuilder.new(obj, opts) do |f|
      yield(f) if block_given?
    end.build
  end
end
