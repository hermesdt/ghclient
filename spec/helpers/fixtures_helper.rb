require 'yaml'

module Helpers
  module FixturesHelper

    def read_fixture file
      text = File.read(File.join(File.dirname(__FILE__), "..", "fixtures", file))
      YAML.load(text)
    end
  end
end