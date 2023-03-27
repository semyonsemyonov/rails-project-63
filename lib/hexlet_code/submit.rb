# frozen_string_literal: true

module HexletCode
  # Generate submit
  class Submit
    DEFAULT_FORM_ELEMENT = "input"
    DEFAULT_TYPE = "submit"
    DEFAULT_VAlUE = "Save"

    def initialize(name, attributes = {})
      @attributes = prepare_submit_attributes(attributes.merge!(name:))
    end

    attr_accessor :attributes

    def prepare_submit_attributes(attributes)
      attributes[:type] = DEFAULT_TYPE
      attributes[:value] = attributes[:name] || DEFAULT_VAlUE

      attributes
    end

    def build
      Tag.new(DEFAULT_FORM_ELEMENT, attributes).build
    end
  end
end
