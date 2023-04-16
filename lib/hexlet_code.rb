# frozen_string_literal: true

# Form generator
module HexletCode
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:InputBuilder, 'hexlet_code/input_builder')
  autoload(:Builder, 'hexlet_code/builder')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:Input, 'hexlet_code/input')
  autoload(:Submit, 'hexlet_code/submit')
  autoload(:Label, 'hexlet_code/label')
  autoload(:Textarea, 'hexlet_code/textarea')
  autoload(:Renderer, 'hexlet_code/renderer')
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
