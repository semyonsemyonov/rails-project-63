# frozen_string_literal: true

module HexletCode
  # Service fot generation html form
  class FormBuilder < Builder
    FORM_ELEMENT = 'form'
    DEFAULT_METHOD = 'post'
    DEFAULT_URL = '#'

    def initialize(entity, params = {})
      super
      @name = FORM_ELEMENT
      @attributes = prepare_form_attributes(params)
    end

    def prepare_form_attributes(params)
      attributes = params.except(:url)
      attributes[:action] = params[:url] || DEFAULT_URL
      attributes[:method] ||= DEFAULT_METHOD

      attributes
    end

    def input(identifier, params = {})
      fields << Label.new(identifier, nil, {})
      input_params = params.merge!(identifier:)
      fields << InputBuilder.new(entity, input_params).build
    end

    def submit(identifier = nil, params = {})
      submit_params = params
      submit_params[:value] = identifier
      fields << Submit.new(identifier, nil, params)
    end
  end
end
