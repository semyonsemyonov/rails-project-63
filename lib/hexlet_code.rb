# frozen_string_literal: true

# Form generator
module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:Input, 'hexlet_code/input')
  autoload(:Submit, 'hexlet_code/submit')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Renderer, 'hexlet_code/renderer')
  autoload(:Label, 'hexlet_code/label')
  autoload(:VERSION, 'hexlet_code/version')

  class Error < StandardError; end

  def self.form_for(entity, opts = {})
    form = FormBuilder.new(entity, opts)
    yield form if block_given?
    Renderer.new(form).to_html
  rescue Error
    HexletCode::Error
  end
end
