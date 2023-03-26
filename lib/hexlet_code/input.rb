# frozen_string_literal: true

require_relative "tag"

module HexletCode
  # Generate input
  class Input
    DEFAULT_FORM_ELEMENT = "input"
    DEFAULT_TEXT = "hexlet"
    TEXTAREA_ELEMENT = "textarea"
    REJECTED_ATTRIBUTES = %w[as].freeze

    def initialize(name, attributes = {})
      @element = select_element_type(attributes[:as])
      @attributes = collect_input_attributes(attributes.merge!(name:))
    end

    attr_accessor :attributes, :element

    def collect_input_attributes(attributes)
      REJECTED_ATTRIBUTES.map { |rejected| attributes.delete(rejected.to_sym) }

      attributes
    end

    def select_element_type(element)
      return DEFAULT_FORM_ELEMENT unless element

      if element == :text
        @content = proc { DEFAULT_TEXT }

        return TEXTAREA_ELEMENT
      end
      element
    end

    def build
      Tag.new(element, attributes).build(&@content)
    end
  end
end
