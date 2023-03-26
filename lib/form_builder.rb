# frozen_string_literal: true

require_relative "tag"

module HexletCode
  # Service fot generation html form
  class FormBuilder
    FORM_ELEMENT = "form"
    DEFAULT_METHOD = "post"

    def initialize(entity, attributes = {})
      @entity = entity
      @attributes = attributes
      yield if block_given?
    end

    attr_accessor :entity, :attributes

    def build
      action = attributes[:url] || "#"
      Tag.build(FORM_ELEMENT, method: DEFAULT_METHOD, action:) {}
    end
  end
end
