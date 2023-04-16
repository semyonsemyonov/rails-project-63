# frozen_string_literal: true

module HexletCode
  # Generate input
  class Textarea < Tag
    DEFAULT_FORM_ELEMENT = 'textarea'
    DEFAULT_TEXT = 'hexlet'

    def initialize(identifier, content, params = {})
      super
      @name = DEFAULT_FORM_ELEMENT
      @attributes = prepare_textarea_attributes(params)
      @content = content || DEFAULT_TEXT
    end

    def prepare_textarea_attributes(params)
      attributes = params
      attributes[:type] = DEFAULT_TYPE

      attributes
    end
  end
end
