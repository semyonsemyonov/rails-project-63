# frozen_string_literal: true

module HexletCode
  # Generate submit
  class Submit
    autoload(:Tag, "tag")

    DEFAULT_FORM_ELEMENT = "input"
    DEFAULT_TYPE = "submit"
    DEFAULT_NAME = "Save"

    def initialize(name, attributes = {})
      @attributes = prepare_submit_attributes(attributes.merge!(name:))
    end

    attr_accessor :attributes

    def prepare_submit_attributes(attributes)
      attributes[:type] = DEFAULT_TYPE
      attributes[:name] = attributes[:name] || DEFAULT_NAME

      attributes
    end

    def build
      Tag.new(DEFAULT_FORM_ELEMENT, attributes).build
    end
  end
end
