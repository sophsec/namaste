require 'namaste/model'

require 'redcloth'

class Note

  include Namaste::Model

  property :id, Serial

  property :title, String

  property :summary, Text

  has n, :comments

  def short_title
    self.title[0..40]
  end

  def html_summary
    RedCloth.new(self.summary).to_html
  end

  def url
    "/notes/#{self.id}"
  end

end
