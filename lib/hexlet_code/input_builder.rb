# frozen_string_literal: true

module HexletCode
  # Service fot generation inputs
  class InputBuilder < Builder
    class UnknownInputType < StandardError; end

    def verify_input_identifier(identifier)
      raise NoMethodError unless entity.to_h.key?(identifier)
    end

    def value_from_entity(identifier)
      entity[identifier]
    end

    def build_input
      attributes = params.except(:as, :identifier)
      value = value_from_entity(params[:identifier])
      attributes[:value] = value if value
      attributes[:name] = params[:identifier]

      Input.new(params[:identifier], nil, attributes)
    end

    def build_textarea
      attributes = params.except(:as, :identifier, :value)
      name = value_from_entity(params[:identifier])
      attributes[:name] = name || params[:identifier]

      Textarea.new(params[:identifier], params[:value], attributes)
    end

    def build
      verify_input_identifier(params[:identifier])

      return build_input unless params[:as]
      return build_textarea if params[:as] == :text

      raise UnknownInputType
    end
  end
end
