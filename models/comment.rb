require 'namaste/model'

require 'redcloth'

class Comment

  include Namaste::Model

  property :id, Serial

  property :body, Text

  property :created_at, DateTime

  belongs_to :note

  def html_body
    RedCloth.new(self.body).to_html
  end

end
