# frozen_string_literal: true

module HexletCode
  # Service to build tags
  class Tag
    def initialize(name, _attributes)
      @name = name
    end

    attr_accessor :attributes, :name, :content
  end
end
