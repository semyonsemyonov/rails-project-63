# frozen_string_literal: true

module HexletCode
  # Service to build tags
  class Tag
    DEFAULT_TYPE = 'text'
    DEFAULT_TAG = 'input'

    def initialize(identifier, content, params)
      @content = content
      @name = DEFAULT_TAG
      @attributes = params
      @identifier = identifier
    end

    attr_accessor :name, :attributes, :identifier, :content
  end
end
