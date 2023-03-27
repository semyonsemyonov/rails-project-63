# frozen_string_literal: true

module HexletCode
  # Generate input
  class Input
    DEFAULT_FORM_ELEMENT = 'input'
    DEFAULT_TEXT = 'hexlet'
    TEXTAREA_ELEMENT = 'textarea'
    REJECTED_ATTRIBUTES = %w[as].freeze
    DEFAULT_LABEL_ELEMENT = 'label'
    DEFAULT_TYPE = 'text'

    def initialize(name, value, attributes = {})
      @value = value
      @element = select_element_type(attributes[:as])
      @attributes = prepare_input_attributes(attributes.merge!(name:))
      @label_attributes = { for: name }
      @label_content = proc { name.capitalize }
      @label_element = DEFAULT_LABEL_ELEMENT
      @fields = []
    end

    attr_accessor :attributes, :element, :label_attributes, :label_element, :fields, :value

    def prepare_input_attributes(attributes)
      REJECTED_ATTRIBUTES.map { |rejected| attributes.delete(rejected.to_sym) }
      attributes['value'] = value if value
      attributes['type'] = DEFAULT_TYPE

      attributes
    end

    def select_element_type(element)
      return DEFAULT_FORM_ELEMENT unless element

      if element == :text
        text_value = value
        @content = proc { text_value || DEFAULT_TEXT }
        @value = nil

        return TEXTAREA_ELEMENT
      end

      element
    end

    def build_input
      fields << Tag.new(element, attributes).build(&@content)
    end

    def build_label
      fields << Tag.new(label_element, label_attributes).build(&@label_content)
    end

    def build
      build_label
      build_input

      fields
    end
  end
end
