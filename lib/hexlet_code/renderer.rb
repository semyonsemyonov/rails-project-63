# frozen_string_literal: true

module HexletCode
  class Renderer
    class UnknownTypeOfObject < StandardError; end

    def initialize(form)
      raise UnknownTypeOfObject unless form.is_a?(HexletCode::FormBuilder)

      @form = form
      @output = ''
    end

    attr_accessor :form, :output

    def open_html_tag(name, attributes)
      "<#{name}#{attributes}>"
    end

    def close_html_tag(name)
      "</#{name}>"
    end

    def to_html_attribute(attributes)
      attributes.map { |key, value| " #{key}=\"#{value}\"" }.sort.join
    end

    def element_to_html(element)
      render_element(element.name, to_html_attribute(element.attributes), element.content)
    end

    def render_element(name, attributes, content)
      @output += open_html_tag(name, attributes)
      return unless content

      @output += content
      @output += close_html_tag(name)
    end

    def to_html
      @output += open_html_tag(form.name, to_html_attribute(form.attributes))
      form.fields.each do |element|
        element_to_html(element)
      end
      @output += close_html_tag(form.name)
    end
  end
end
