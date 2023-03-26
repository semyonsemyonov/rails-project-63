# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  class Tag
    def self.build(name, **params)
      attributes = params.map { |key, value| " #{key}=\"#{value}\"" }.join

      if block_given?
        "<#{name}#{attributes}>#{yield}</#{name}>"
      else
        "<#{name}#{attributes}>"
      end
    end
  end
end
