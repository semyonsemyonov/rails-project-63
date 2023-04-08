# frozen_string_literal: true

module HexletCode
  # Generate input
  class Label < HexletCode::Tag
    DEFAULT_LABEL_ELEMENT = 'label'
    DEFAULT_TYPE = 'text'

    def initialize(name, _params)
      super
      @attributes = { for: name }
      @content = name.to_s.capitalize
      @name = DEFAULT_LABEL_ELEMENT
    end
  end
end
