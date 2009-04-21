require 'namaste/model'

require 'bluecloth'

module Namaste
  class Note

    include Model

    property :id, Serial

    property :title, String

    property :summary, Text

    has n, :comments

    def short_title
      self.title[0..40]
    end

    def html_summary
      BlueCloth.new(self.summary).to_html
    end

    def url
      "/notes/#{self.id}"
    end

  end
end
