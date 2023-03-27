# frozen_string_literal: true

module HexletCode
  # Generate input
  class Input
    DEFAULT_FORM_ELEMENT = "input"
    DEFAULT_TEXT = "hexlet"
    TEXTAREA_ELEMENT = "textarea"
    REJECTED_ATTRIBUTES = %w[as].freeze

    def initialize(name, default_value, attributes = {})
      @default_value = default_value
      @element = select_element_type(attributes[:as])
      @attributes = prepare_input_attributes(attributes.merge!(name:))
    end

    attr_accessor :attributes, :element

    def prepare_input_attributes(attributes)
      REJECTED_ATTRIBUTES.map { |rejected| attributes.delete(rejected.to_sym) }
      attributes["value"] = @default_value if @default_value

      attributes
    end

    def select_element_type(element)
      return DEFAULT_FORM_ELEMENT unless element

      if element == :text
        value = @default_value
        @content = proc { value || DEFAULT_TEXT }
        @default_value = nil

        return TEXTAREA_ELEMENT
      end
      element
    end

    def build
      Tag.new(element, attributes).build(&@content)
    end
  end
end
