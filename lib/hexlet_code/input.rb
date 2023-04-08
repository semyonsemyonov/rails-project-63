# frozen_string_literal: true

module HexletCode
  autoload(:Tag, 'hexlet_code/tag')

  # Generate input
  class Input < Tag
    DEFAULT_FORM_ELEMENT = 'input'
    DEFAULT_TEXT = 'hexlet'
    TEXTAREA_ELEMENT = 'textarea'
    ALLOWED_ATTRIBUTES = %w[class type value name].freeze
    DEFAULT_TYPE = 'text'

    def initialize(name, params = {})
      super
      @name = select_element_type(params)
      @attributes = prepare_input_attributes(params.merge!(name:))
    end

    def prepare_input_attributes(attributes)
      attributes['type'] = DEFAULT_TYPE
      attributes.select do |key, attr_val|
        next if name == TEXTAREA_ELEMENT && key == :value

        ALLOWED_ATTRIBUTES.include?(key.to_s) && !attr_val.to_s.empty?
      end
    end

    def select_element_type(params)
      type = params[:as]
      return DEFAULT_FORM_ELEMENT unless type

      if type == :text
        @content = params[:value] || DEFAULT_TEXT

        return TEXTAREA_ELEMENT
      end

      type
    end
  end
end
