# frozen_string_literal: true

require_relative "tag"
require_relative "input"

module HexletCode
  # Service fot generation html form
  class FormBuilder
    FORM_ELEMENT = "form"
    DEFAULT_METHOD = "post"

    def initialize(entity, attributes = {})
      @entity = entity
      @attributes = attributes
      @fields = []
    end

    attr_accessor :entity, :attributes, :content

    def input(name, attributes = {})
      verify_input_name(name)
      @fields << Input.new(name, default_value(name), attributes).build

      @fields.join
    end

    def verify_input_name(name)
      raise HexletCode::Error unless entity.to_h.key?(name)
    end

    def default_value(name)
      entity[name]
    end

    def build
      action = attributes[:url] || "#"
      Tag.new(FORM_ELEMENT, method: DEFAULT_METHOD, action:).build do
        yield(self) if block_given?
      end
    end
  end
end
