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
      @fields << Input.new(name, attributes).build

      @fields.join
    end

    def verify_entity_fields(name)
      entity.send(name)
    end

    def build
      action = attributes[:url] || "#"
      Tag.new(FORM_ELEMENT, method: DEFAULT_METHOD, action:).build do
        yield(self) if block_given?
      end
    end
  end
end
