# revert
require "haml/rails_template"

module Haml
  class RailsTemplate
    # basically revert https://github.com/haml/haml/pull/1144
    # see https://github.com/haml/haml/issues/1154
    def default_format
      nil
    end
  end
end
