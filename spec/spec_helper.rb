# frozen_string_literal: true

path = File.expand_path(File.join(File.dirname(__FILE__), "../lib"))
$LOAD_PATH << path

Dir[File.join(path, "**/*.rb")].each { |file| require file }

module SpecHelpers
  def fixture(name)
    File.read(Dir["spec/fixtures/*"].find { |f| File.basename(f, ".html") == name })
  end
end

RSpec.configure do |c|
  c.include SpecHelpers
end
