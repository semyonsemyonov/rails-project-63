# frozen_string_literal: true

require 'hexlet_code'

module SpecHelpers
  def get_fixture(name)
    File.read(Dir['spec/fixtures/*'].find { |f| File.basename(f, '.html') == name })
  end
end

RSpec.configure do |c|
  c.include SpecHelpers
end
