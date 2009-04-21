require 'namaste/model'

require 'bluecloth'

module Namaste
  class Comment

    include Model

    property :id, Serial

    property :body, Text

    property :created_at, DateTime

    belongs_to :note

    def html_body
      BlueCloth.new(self.body).to_html
    end

  end
end
