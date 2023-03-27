# frozen_string_literal: true

module HexletCode
  # Service to build tags
  class Tag
    def initialize(name, params)
      @name = name
      @attributes = params.map { |key, value| " #{key}=\"#{value}\"" }.sort.join
    end

    attr_accessor :attributes, :name

    def open_tag
      "<#{name}#{attributes}>"
    end

    def close_tag
      "</#{name}>"
    end

    def build
      return open_tag unless block_given?

      "#{open_tag}#{yield}#{close_tag}"
    end
  end
end
