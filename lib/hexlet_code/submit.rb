# frozen_string_literal: true

module HexletCode
  # Generate submit
  class Submit < Tag
    DEFAULT_FORM_ELEMENT = 'input'
    DEFAULT_TYPE = 'submit'
    DEFAULT_VALUE = 'Save'

    def initialize(value, params = {})
      super
      @name = DEFAULT_FORM_ELEMENT
      @attributes = prepare_submit_attributes(params.merge!(value:))
      @element = DEFAULT_FORM_ELEMENT
      @content = nil
    end

    def prepare_submit_attributes(attributes)
      attributes[:type] = DEFAULT_TYPE
      attributes[:value] ||= DEFAULT_VALUE

      attributes
    end
  end
end
