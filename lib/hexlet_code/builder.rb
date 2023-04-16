# frozen_string_literal: true

module HexletCode
  # Build objects
  class Builder
    def initialize(entity, params)
      @entity = entity
      @params = params
      @fields = []
    end

    attr_accessor :name, :entity, :params, :content, :fields, :attributes
  end
end
