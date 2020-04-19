# frozen_string_literal: true

require 'json'

module TimeDashlet
  class Template
    def self.render(title, message)
      {
        title: title,
        message: message
      }.to_json
    end
  end
end
