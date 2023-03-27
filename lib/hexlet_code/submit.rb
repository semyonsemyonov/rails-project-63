# frozen_string_literal: true

module HexletCode
  # Generate submit
  class Submit
    DEFAULT_FORM_ELEMENT = 'input'
    DEFAULT_TYPE = 'submit'
    DEFAULT_VALUE = 'Save'

    def initialize(value, attributes = {})
      @attributes = prepare_submit_attributes(attributes.merge!(value:))
    end

    attr_accessor :attributes

    def prepare_submit_attributes(attributes)
      attributes[:type] = DEFAULT_TYPE
      attributes[:value] ||= DEFAULT_VALUE

      attributes
    end

    def build
      Tag.new(DEFAULT_FORM_ELEMENT, attributes).build
    end
  end
end
