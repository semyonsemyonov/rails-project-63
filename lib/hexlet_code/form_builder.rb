# frozen_string_literal: true

module HexletCode
  # Service fot generation html form
  class FormBuilder
    FORM_ELEMENT = 'form'
    DEFAULT_METHOD = 'post'
    DEFAULT_URL = '#'
    ALLOWED_ATTRIBUTES = %w[action method class].freeze

    def initialize(entity, attributes = {})
      @entity = entity
      @name = FORM_ELEMENT
      @attributes = prepare_form_attributes(attributes)
      @fields = []
    end

    attr_accessor :name, :entity, :attributes, :content, :fields

    def prepare_form_attributes(attributes)
      attributes[:action] = attributes[:url] || DEFAULT_URL
      attributes[:method] = attributes[:method] || DEFAULT_METHOD

      attributes.select do |key, attr_val|
        ALLOWED_ATTRIBUTES.include?(key.to_s) && !attr_val.to_s.empty?
      end
    end

    def input(name, attributes = {})
      verify_input_name(name)
      fields << Label.new(name, nil)
      fields << Input.new(name, attributes.merge(entity_value: value_from_entity(name)))
    end

    def submit(name = nil, attributes = {})
      fields << Submit.new(name, attributes)
    end

    def verify_input_name(name)
      raise NoMethodError unless entity.to_h.key?(name)
    end

    def value_from_entity(name)
      entity[name]
    end
  end
end
