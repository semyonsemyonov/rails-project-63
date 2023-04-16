# frozen_string_literal: true

module HexletCode
  # Generate submit
  class Submit < Tag
    SUBMIT_TYPE = 'submit'
    DEFAULT_VALUE = 'Save'

    def initialize(identifier, content, params = {})
      super
      @name = DEFAULT_TAG
      @attributes = prepare_submit_attributes(params)
    end

    def prepare_submit_attributes(params)
      attributes = params
      attributes[:type] ||= SUBMIT_TYPE
      attributes[:value] ||= DEFAULT_VALUE

      attributes
    end
  end
end
