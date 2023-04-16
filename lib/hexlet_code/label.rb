# frozen_string_literal: true

module HexletCode
  # Generate input
  class Label < Tag
    LABEL_ELEMENT = 'label'

    def initialize(identifier, content, _params)
      super
      @attributes = { for: identifier }
      @content = content || identifier.to_s.capitalize
      @name = LABEL_ELEMENT
    end
  end
end
