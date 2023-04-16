# frozen_string_literal: true

module HexletCode
  # Generate input
  class Input < Tag
    def initialize(identifier, content, params)
      super
      @attributes = prepare_input_attributes(params)
      @name = DEFAULT_TAG
    end

    def prepare_input_attributes(params)
      attributes = params
      attributes[:type] ||= DEFAULT_TYPE

      attributes
    end
  end
end
