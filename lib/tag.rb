# frozen_string_literal: true

module HexletCode

  # Service to build tags
  class Tag
    def self.build(name, **params)
      attributes = params.map { |key, value| " #{key}=\"#{value}\"" }.sort.join
      return "<#{name}#{attributes}>" unless block_given?

      "<#{name}#{attributes}>#{yield}</#{name}>"
    end
  end
end