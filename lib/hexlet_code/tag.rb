# frozen_string_literal: true

module HexletCode
  # Service to build tags
  class Tag

    def initialize(name, params)
      @name = name
      @attributes = params.map { |key, value| " #{key}=\"#{value}\"" }.sort.join
    end

    attr_accessor :attributes, :name

    def build
      return "<#{name}#{attributes}>" unless block_given?

      "<#{name}#{attributes}>#{yield}</#{name}>"
    end
  end
end
