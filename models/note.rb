require 'namaste/model'

class Note

  include Namaste::Model

  property :id, Serial

  property :title, String

  property :body, Text

  has n, :comments

  def short_title
    self.title[0..40]
  end

end
