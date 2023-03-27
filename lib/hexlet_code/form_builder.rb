# frozen_string_literal: true

module HexletCode
  # Service fot generation html form
  class FormBuilder
    FORM_ELEMENT = "form"
    DEFAULT_METHOD = "post"
    DEFAULT_URL = "#"

    def initialize(entity, attributes = {})
      @entity = entity
      @attributes = prepare_form_attributes(attributes)
      @fields = []
    end

    attr_accessor :entity, :attributes, :content

    def prepare_form_attributes(attributes)
      attributes[:action] = attributes[:url] || DEFAULT_URL
      attributes[:method] || DEFAULT_METHOD

      attributes
    end

    def input(name, attributes = {})
      verify_input_name(name)
      @fields << Input.new(name, default_value(name), attributes).build

      @fields.join
    end

    def submit(name = nil, attributes = {})
      @fields << Submit.new(name, attributes).build

      @fields.join
    end

    def verify_input_name(name)
      raise NoMethodError unless entity.to_h.key?(name)
    end

    def default_value(name)
      entity[name]
    end

    def build
      Tag.new(FORM_ELEMENT, attributes).build do
        yield(self) if block_given?
      end
    end
  end
end
